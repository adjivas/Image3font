# Image3font

[![travis-badge](https://travis-ci.org/adjivas/Image3font.svg?branch=master&style=flat)](https://travis-ci.org/adjivas/Image3font)
[![project-badge](https://img.shields.io/pypi/v/image3font.svg)](https://pypi.org/project/image3font)
[![license-badge](http://img.shields.io/badge/license-GPLv3-blue.svg?style=flat-square)](https://github.com/adjivas/Image3font/blob/master/LICENSE)

A image's converter to font written in
[FontForge](https://github.com/fontforge/fontforge)/[FontTools](https://github.com/fonttools/fonttools)'
[Hy](https://github.com/hylang/hy) language and the futur of
[image2font](https://github.com/limaconoob/Image2font/)'s repository.

### Installation

The [image3font](https://pypi.org/project/image3font) package is listed
in the Python Package Index (PyPI), so you can install it with pip:

    pip install image3font

### Usage

See command help:
* **-h, --help** - show this help message and exit.
* **-v, --version** - show the version and exit.
* **-m MANIFEST, --manifest MANIFEST** - specify the manifest.

#### Layout

*Image3font* uses conventions for file placement:
```
image3font.toml
src/
src/{:x}.svg
src/{:x}-.svg (need the wand dependency)
```

-   **image3font.toml** stores in the root of your project.
-   **image/SVG** goes in the **src** directory.

### Dependency

-   [fontforge](https://github.com/fontforge/fontforge) must be
    installed.

#### Requirement

The [requirements.txt](requirements.txt) describes the image3font's dependencies:

-   [hy](https://github.com/hylang/hy) - A dialect of Lisp that's
    embedded in Python.
-   [fonttools](https://github.com/fonttools/fonttools) - A library to
    manipulate font files from Python.
-   [docopt](https://github.com/docopt/docopt) - Pythonic command line
    arguments parser.
-   [toml](https://github.com/uiri/toml) - Python lib for TOML.

The [requirements-wand.txt](requirements-wand.txt) is optional, that needed to extract a sub-rectangle from an image/SVG:

-   [wand](https://github.com/dahlia/wand) - The ctypes-based simple [ImageMagick](https://github.com/ImageMagick/ImageMagick) binding for Python (tested on imagemagick6 6.9.9.33-1).


### Manifest

The *image3font.toml* file for each font is called its manifest. Every
manifest file consists of two fields and two sections:

- **path** (optional)
Fontpath of input font. If not specified this
will be infered from a empty font.

- **source** (default = "src") 
Can be used to configure the SVG's
directory.

#### \[fontforge\]'s section

List of fields according to
[FontForge](https://fontforge.github.io/en-US/documentation/scripting/native)/Script's
specification.

- **path**

Path where save the compiled font.

- **fontname**

Name contained in the postscript FontName field.

- **familyname** (default = "fontname")

Name contained in the
postscript FamilyName field. If not specified this will be inferred as
fontname.

- **fullname** (default = "fontname")

Name contained in the postscript
FullName field. If not specified this will be inferred as fontname.

- **weight** (optional)

Name contained in the postscript Weight field.

- **copyright** (optional)

Name contained in the postscript Notice
field.

-   **version** (optional)
-   **encoding** (default = "UnicodeFull")
-   **em** (default = 2028)

#### \[fonttools\]'s section

List of fields according to
[FontTools/Name-IDs](https://www.microsoft.com/typography/otspec/name.htm#nameIDs)'s
specification.

- **copyright**

Copyright string from the font vendor. © Copyright the
Monotype Corporation plc, 1990.

- **familyname**

Name the user sees. Times New Roman

- **subfamilyname**

Name of the style. Bold

- **unique\_id**

A unique identifier that applications can store to
identify the font being used. Monotype: Times New Roman Bold:1990

- **full\_name**

Complete, unique, human readable name of the font.
This name is used by Windows. Times New Roman Bold

- **version**

Release and version information from the font vendor.
Version 1.00 June 1, 1990, initial release.

- **postscript\_name**

Name the font will be known by on a PostScript
printer. TimesNewRoman-Bold

- **trademark**

Trademark string. Times New Roman is a registered
trademark of the Monotype Corporation.

- **manufacturer**

Manufacturer. Monotype Corporation. plc

- **designer**

Designer. Stanley Morison

- **description**

Description. Designed in 1932 for the Times of London
newspaper. Excellent readability and a narrow overall width, allowing
more words per line than most fonts.

- **url\_vendor**

URL of Vendor. <http://www.monotype.com>

- **url\_designer** 

URL of Designer. <http://www.monotype.com>

- **license**

License Description. This font may be installed on all of
your machines and printers, but you may not sell or give these fonts to
anyone else.

- **url\_license**
License Info URL. <http://www.monotype.com/license>

- **reserved**
Reserved.

- **preferred\_familyname**

Preferred Family. No name string present,
since it is the same as name ID 1 (Font Family name).

- **preferred\_subfamilyname**

Preferred Subfamily. No name string
present, since it is the same as name ID 2 (Font Subfamily name).

- **compatible\_full**

Compatible Full (Macintosh only). No name string
present, since it is the same as name ID 4 (Full name).

- **sample\_text**

Sample text. quick brown fox jumps over the lazy
dog.

- **postscript\_cid**

PostScript CID findfont name. No name string
present. Thus, the PostScript Name defined by name ID 6 should be used
with the "findfont" invocation for locating the font in the context of a
PostScript interpreter.

- **wws\_familyname**

WWS family name: Since Times New Roman is a WWS
font, this field does not need to be specified. If the font contained
styles such as "caption", "display", "handwriting", etc, that would be
noted here.

- **wws\_subfamilyname**

WWS subfamily name: Since Times New Roman is a
WWS font, this field does not need to be specified.

- **light\_background**

Light background palette name. No name string
present, since this is not a color font.

- **dark\_background**

Dark background palette name. No name string
present, since this is not a color font.

- **variations\_postscript**

Variations PostScript name prefix. No name
string present, since this is not a variable font.

### Knowledge

This is a reading list of material relevant to *Image3Font*. It includes
prior research that has - at one time or another - influenced the design
of *image3font*, as well as publications about *imag3font*.

-   [SVG in OpenType](https://www.w3.org/2013/10/SVG_in_OpenType) - SVG
    Glyphs in OpenType Specification.
-   [Otspec](https://www.microsoft.com/typography/otspec) - OpenType
    specification.

- [FontForge
scripting](https://fontforge.github.io/en-US/documentation/scripting/native)
Writing scripts to change fonts in FontForge.

-   [Adobe
    Opentype](http://www.adobe.com/devnet/opentype/afdko/topic_feature_file_syntax.html)
    Adobe OpenType feature.

### License

*Image3font*'s code in this repo uses the [GNU GPL
v3](http://www.gnu.org/licenses/gpl-3.0.html)
[license](https://raw.githubusercontent.com/adjivas/Image3font/master/LICENSE).

#### Dependencies

Many thanks goes to *command/etc*'s project:

-   [FontForge](https://github.com/fontforge/fontforge) - [GNU GPL v3
    license](https://github.com/fontforge/fontforge/blob/master/LICENSE).
-   [FontTools](https://github.com/fonttools/fonttools) - [MIT Open
    Source
    license](https://github.com/fonttools/fonttools/blob/master/LICENSE).
-   [HyLang](https://github.com/hylang/hy) - [MIT Open Source
    license](https://github.com/hylang/hy/blob/master/LICENSE).
-   [docopt](https://github.com/docopt/docopt) - [MIT Open Source
    license](https://github.com/docopt/docopt/blob/master/LICENSE-MIT).
-   [Toml](https://github.com/uiri/toml) - [MIT Open Source
    license](https://github.com/uiri/toml/blob/master/LICENSE).
-   [Wand](https://github.com/dahlia/wand) - [MIT Open Source
    license](https://github.com/dahlia/wand/blob/master/LICENSE).
-   [Wikipedia (for the picture
    neko!)](https://en.wikipedia.org/wiki/Catgirl).
