#! /usr/bin/env hy

(import os)
(import re)

(import argparse)
(import toml)

(import fontforge)

(import [fontTools.ttLib [TTFont]])
(import [fontTools.ttLib.tables.S-V-G- [table-S-V-G-]])
(import [fontTools.ttLib.tables.-n-a-m-e [table--n-a-m-e]])
(import [fontTools.ttLib.tables.-g-l-y-f [table--g-l-y-f]])

(import [xml.etree.ElementTree :as ET])

(import [table[*name* *platform*]])

;; Program's Source
(def *source* (constantly "src"))
;; Program's name
(def *prog* (constantly "image3font"))
;; Program's version
(def *version* (constantly "1.1.2"))

;; Fontforge's EM
(def *font-em* (constantly 2048))
;; Fontforge's Encoding
(def *font-encoding* (constantly "UnicodeFull"))
;; Fontforge's Width
(def *width* (constantly 512))

;; The structure Glyph is a path by id
(defclass Glyph [object]
    [path id]
  
    ;; Constructor of Glyph
    (defn --init-- [self path id &optional [delete False]]
        (setv self.delete delete)
        (setv self.path path)
        (setv self.id id)
  
        (setv root (ET.fromstring (.read (open path))))
  
        ;; Remove the viewBox/height/width attributes because there are inconsistently on IE{9..11} and Gecko.
        (setv view-box (.split (str "0 0 200 200")))
        (if (root.get "viewBox")
            (do (setv view-box (.split (get root.attrib "viewBox")))
                (del (get root.attrib "viewBox"))))
        (setv height (get view-box 2))
        (if (root.get "height")
            (do (setv height (re.sub "[^0-9\.]" "" (get root.attrib "height")))
                (del (get root.attrib "height"))))
        (setv weight (get view-box 3))
        (if (root.get "width")
            (do (setv width (re.sub "[^0-9\.]" "" (get root.attrib "width")))
                (del (get root.attrib "width"))))
  
        (setv scale (/ (*font-em*) (int height)))
        (setv x 0)
        (setv y (* -1 (- (*font-em*) (* (*font-em*) .2))))
        (setv g (ET.Element "g" {"transform" (.format "translate({},{}) scale({})" x y scale)}))
        (list (map (fn [element] (g.append element))
                   (root.getchildren)))
        (root.clear)
        (root.append g)
  
        (setv self.height (float height))
        (setv self.width (float width))
  
        (setv self.root root))
  
    ;; Destructor of Glyph
    (defn --del--[self]
        (if self.delete (os.remove self.path)))
  
    ;; Return glyph width
    (defn get-width[self]
        (int (* (*font-em*) (/ self.width self.height))))
  
    ;; Return our copy of blob
    (defn get-svg[self]
        (setv data (ET.tostring self.root :encoding "UTF-8"))
        [data self.id self.id])
  
    ;; Set the glyph identifier as glyph<glyphID> https://www.w3.org/2013/10/SVG_in_OpenType/#glyphids
    (defn set-id[self id]
        (setv self.id id)
        (self.root.set "id" (.format "glyph{:d}" id))))

;; Reference: http://docs.wand-py.org/en/0.4.4/guide/resizecrop.html
;; crop a image from index's argument by  *width*/*height*'s global
(defn 3crop [source path segy segx &optional [begindex 0xe000]]
    (import [wand.image [Image]])
    (import [wand.display [display]])
  
    (setv image (Image :filename path))
    (setv (, width  height) image.size)
  
    ;; Imagemagick's width
    (def w (int (/ width segx)))
    ;; Imagemagick's height
    (def h (int (/ height segy)))
    (setv (, x y) (, (int (/ width w)) (int (/ height h))))
    (list (map (fn [(, supindex (, pxy pxx))] (setv subimage (image.clone))
                                          (setv index (+ begindex supindex))
                                          (setv path (os.path.join source (.format "{:x}.svg" index)))
                                          (subimage.crop (* pxx w) (* pxy h) :width w :height h)
                                          (subimage.save :filename path)
                                          (Glyph path index :delete True))
               (partition (interleave (range (* x y))
                                      (list-comp (, a b) (a (range y) b (range x))))))))

;; Return a collection of glyphes
;; if the namefile containt '-', crop and return a set of image/vector
;; else convert the filename into a vector if isn't already and return it.
(defn 3glyph [&optional [source (*source*)]]
    (flatten (map (fn [(, (, name extension) path)] 
                       (setv group (.split name "-"))
                       (if (= (len group) 3)
                           (do
                              (setv (, index segy segx) group)
                              (3crop source path (int segy) (int segx) :begindex (int index 16)))
                           (Glyph path (int (first group) 16))))
                  (list (map (fn [file] (, (os.path.splitext file) (os.path.join source file)))
                             (sorted (os.listdir source)))))))

;; add tables: "SVG " and "name".
(defn 3table [manifest glyphes]
    (setv path (.get (manifest.get "fontforge") "path"))
    (setv font (TTFont path))
    (setv submanifest (or (manifest.get "fontools") {}))
  
    ;; Avoid "ns0:"
    ;; Reference: https://docs.python.org/2/library/xml.etree.elementtree.html#xml.etree.ElementTree.register_namespace
    (ET.register-namespace "" "http://www.w3.org/2000/svg")
  
    (setv cmap (font.get "cmap"))
    (setv cmap (dict (partition (flatten (map (fn [table] (table.cmap.items))
                                         (filter (fn [table] (table.isUnicode))
                                                 cmap.tables))))))
  
    (setv table (table-S-V-G-))
    (setv table.colorPalettes None)
    (setv table.docList (list (map (fn [glyph]
                                       (glyph.set-id (font.getGlyphID (cmap.get glyph.id)))
                                       (glyph.get-svg))
                              glyphes)))
  
    (font.--setitem-- "SVG " table)
  
    (setv table (table--n-a-m-e))
    (setv table.names [])
  
    (list (map (fn [(, id text)]
                   (table.setName (unicode text) id
                                  (:id (:unicode *platform*))
                                  (:unicode-1-0 (:encoding (:unicode *platform*)))
                                  (:language (:unicode *platform*)))
                   (table.setName (unicode text) id
                                  (:id (:macintosh *platform*))
                                  (:roman (:encoding (:macintosh *platform*)))
                                  (:english (:language (:macintosh *platform*))))
                   (table.setName (unicode text) id
                                  (:id (:windows *platform*))
                                  (:unicode-bmp (:encoding (:windows *platform*)))
                                  (:united-states (:english (:language (:windows *platform*))))))
               (filter (fn [(, _ value)] (not (none? value)))
                                         (map (fn [(, index key)] (, index (submanifest.get key)))
                                                                  (partition (interleave (iterate inc 0) *name*))))))
  
    (font.--setitem-- "name" table)
  
    (setv glyf (font.--getitem-- "glyf"))
    (setv notdef (glyf.glyphs.--getitem-- ".notdef"))
  
    ;; Reverse engineering of .notdef
    (notdef.fromXML "contour" () [(, "pt" {"x" "68" "y" "0" "on" "1"} ())
                                  (, "pt" {"x" "68" "y" "1365" "on" "1"} ())
                                  (, "pt" {"x" "612" "y" "1365" "on" "1"} ())
                                  (, "pt" {"x" "612" "y" "0" "on" "1"} ())] ())
    (notdef.fromXML "contour" () [(, "pt" {"x" "136" "y" "68" "on" "1"} ())
                                  (, "pt" {"x" "544" "y" "68" "on" "1"} ())
                                  (, "pt" {"x" "544" "y" "1297" "on" "1"} ())
                                  (, "pt" {"x" "136" "y" "1297" "on" "1"} ())] ())
    (notdef.fromXML "instructions" () [(, "assembly" () "")] ())
  
    (setv (, root filename) (os.path.split path))
    (setv hide (os.path.join root (+ "." filename)))
    (font.save hide)
    (os.rename hide path))

;; open or create a font, configure this font according to the manifest, add a ligature, add recommended glyphes.
(defn 3font [manifest]
    (setv submanifest (manifest.get "fontforge"))
    (setv font (if (manifest.get "path") (fontforge.open (manifest.get "path")) (fontforge.font)))
  
    ;; Reference: https://fontforge.github.io/en-US/documentation/scripting/native
    (assert (submanifest.get "path"))
    (assert (submanifest.get "fontname"))
    (setv font.fontname (submanifest.get "fontname"))
    (setv font.familyname (or (submanifest.get "familyname") (submanifest.get "fontname")))
    (setv font.fullname (or (submanifest.get "fullname") (submanifest.get "fontname")))
    (setv font.em (int (or (submanifest.get "em") (*font-em*))))
    (setv font.encoding (or (submanifest.get "encoding") (*font-encoding*)))
    (if (submanifest.get "weight")
        (setv font.weight (submanifest.get "weight")))
    (if (submanifest.get "copyright")
        (setv font.copyright (submanifest.get "copyright")))
    (if (submanifest.get "version")
        (setv font.version (str (submanifest.get "version"))))
  
    ;; Reference: http://www.adobe.com/devnet/opentype/afdko/topic_feature_file_syntax.html#4.h
    (setv liga (str "liga"))
    (setv latn (str "latn"))
    (setv dflt (str "dflt"))
    (setv features (,(, liga (,(, latn dflt)))))
    ;; Reference: https://fontforge.github.io/en-US/documentation/scripting/native/scripting-alpha/#AddLookup
    (font.addLookup "liga" "gsub_ligature" () features)
    (font.addLookupSubtable "liga" "liga")
  
    ;; Reference: https://www.microsoft.com/typography/otspec180/recom.htm § Glyph 0: the .notdef glyph
    (setv char (font.createChar -1 ".notdef"))
    (setv char.width 0)
    ;; Reference: https://www.microsoft.com/typography/otspec170/recom.htm § First Four Glyphs in Fonts
    (setv char (font.createChar 0x0 ".null"))
    (setv char.width (*width*))
    (setv char (font.createChar 0xD "CR"))
    (setv char.width (*width*))
    (setv char (font.createChar 0x20 "space"))
    (setv char.width (*width*))

    (setv glyphes (3glyph :source (or (manifest.get "source") (*source*))))
    (list (map (fn [glyph]
                   (setv char (font.createChar glyph.id))
                   (char.importOutlines glyph.path)
                   (setv char.width (glyph.get-width))
                   (char.removeOverlap)
                   (char.simplify)
                   (char.addExtrema)
                   (char.transform (, 1.0 0.0 0.0 1.0 0.0 0.0)))
               glyphes))

    (font.generate (submanifest.get "path"))
    (font.close)
  
    (3table manifest glyphes))

(defmain [&rest _]
    (setv parser (argparse.ArgumentParser :prog (*prog*) :description "Create color fonts from a set of glyphes."))
    (parser.add-argument "-v" "--version" :action "store_true" :help "show the version and exit")
    (parser.add-argument "-m" "--manifest" :default "image3font.toml" :help "specify the manifest")

    (setv args (parser.parse-args))
    (if args.version (print (*prog*) (*version*)) (3font (toml.load args.manifest))))
