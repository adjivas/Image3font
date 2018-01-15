#! /usr/bin/env hy

;; name — Naming Table: https://www.microsoft.com/typography/otspec180/name.htm

;; Platform IDs: https://www.microsoft.com/typography/otspec180/name.htm#plat
(def *platform* {
  ;; Unicode platform-specific encoding and language IDs (platform ID = 0): https://www.microsoft.com/typography/otspec180/name.htm#enc0
  :unicode {
    :id 0
    ;; encoding IDs
    :encoding {
      ;; Unicode 1.0 semantics
      :unicode-1-0 0
      ;; Unicode 1.1 semantics
      :unicode-1-1 1
      ;; ISO/IEC 10646 semantics
      :iso/iec-10646 2
      ;; Unicode 2.0 and onwards semantics, Unicode BMP only (cmap subtable formats 0, 4, 6).
      :unicode-2-0-bmp 3
      ;; Unicode 2.0 and onwards semantics, Unicode full repertoire (cmap subtable formats 0, 4, 6, 10, 12).
      :unicode-2-0-full 4
      ;; Unicode Variation Sequences (cmap subtable format 14).
      :unicode-variation 5
      ;; Unicode full repertoire (cmap subtable formats 0, 4, 6, 10, 12, 13).
      :unicode-full 6}
    ;; Language ID
    :language 0}
  ;; Macintosh platform-specific encoding and language IDs (platform ID = 1): https://www.microsoft.com/typography/otspec180/name.htm#enc1
  :macintosh {
    :id 1
    ;; Macintosh encoding IDs (script manager codes)
    :encoding {
      :roman 0
      :japanese 1
      :chinese-traditional 2
      :korean 3
      :arabic 4
      :hebrew 5
      :greek 6
      :russian 7
      :rsymbol 8
      :devanagari 9
      :gurmukhi 10
      :gujarati 11
      :oriya 12
      :bengali 13
      :tamil 14
      :telugu 15
      :kannada 16
      :malayalam 17
      :sinhalese 18
      :burmese 19
      :khmer 20
      :thai 21
      :laotian 22
      :georgian 23
      :armenian 24
      :chinese-simplified 25
      :tibetan 26
      :mongolian 27
      :geez 28
      :slavic 29
      :vietnamese 30
      :sindhi 31
      :uninterpreted 32}
    ;; Macintosh language IDs
    :language {
      :english 0
      :french 1
      :german 2
      :italian 3
      :dutch 4
      :swedish 5
      :spanish 6
      :danish 7
      :portuguese 8
      :norwegian 9
      :hebrew 10
      :japanese 11
      :arabic 12
      :finnish 13
      :greek 14
      :icelandic 15
      :maltese 16
      :turkish 17
      :croatian 18
      :chinese-traditional 19
      :urdu 20
      :hindi 21
      :thai 22
      :korean 23
      :lithuanian 24
      :polish 25
      :hungarian 26
      :estonian 27
      :latvian 28
      :sami 29
      :faroese 30
      :farsi-persian 31
      :russian 32
      :chinese-simplified 33
      :flemish 34
      :irish-gaelic 35
      :albanian 36
      :romanian 37
      :czech 38
      :slovak 39
      :slovenian 40
      :yiddish 41
      :serbian 42
      :macedonian 43
      :bulgarian 44
      :ukrainian 45
      :byelorussian 46
      :uzbek 47
      :kazakh 48
      :azerbaijani-cyrillic-script 49
      :azerbaijani-arabic-script 50
      :armenian 51
      :georgian 52
      :moldavian 53
      :kirghiz 54
      :tajiki 55
      :turkmen 56
      :mongolian-mongolian-script 57
      :mongolian-cyrillic-script 58
      :pashto 59
      :kurdish 60
      :kashmiri 61
      :sindhi 62
      :tibetan 63
      :nepali 64
      :sanskrit 65
      :marathi 66
      :bengali 67
      :assamese 68
      :gujarati 69
      :punjabi 70
      :oriya 71
      :malayalam 72
      :kannada 73
      :tamil 74
      :telugu 75
      :sinhalese 76
      :burmese 77
      :khmer 78
      :lao 79
      :vietnamese 80
      :indonesian 81
      :tagalong 82
      :malay-roman-script 83
      :malay-arabic-script 84
      :amharic 85
      :tigrinya 86
      :galla 87
      :somali 88
      :swahili 89
      :kinyarwanda-ruanda 90
      :rundi 91
      :nyanja-chewa 92
      :malagasy 93
      :esperanto 94
      :welsh 128
      :basque 129
      :catalan 130
      :latin 131
      :quenchua 132
      :guarani 133
      :aymara 134
      :tatar 135
      :uighur 136
      :dzongkha 137
      :javanese-roman-script 138
      :sundanese-roman-script 139
      :galician 140
      :afrikaans 141
      :breton 142
      :inuktitut 14
      :scottishgaelic 144
      :manxgaelic 145
      :irishgaelicwithdotabove 146
      :tongan 147
      :greek-polytonic 148
      :greenlandic 149
      :azerbaijani-roman-script 150}}
  ;; ISO specific encoding and language IDs (platform ID = 2) [Deprecated]: https://www.microsoft.com/typography/otspec180/name.htm#enc2
  ;; :isospecific None
  ;; Windows platform-specific encoding and language IDs (platform ID= 3): https://www.microsoft.com/typography/otspec180/name.htm#enc3
  :windows {
    :id 2
    ;; Windows encoding IDs
    :encoding {
      ;; Symbol
      :symbol 0
      ;; Unicode BMP (UCS-2)
      :unicode-bmp 1
      ;; ShiftJIS
      :shift-jis 2
      ;; PRC
      :prc 3
      ;; Big5
      :big-5 4
      ;; Wansung
      :wansung 5
      ;; Johab
      :johab 6
      ;; Unicode UCS-4
      :unicode-ucs-4 10}
    ;; Windows language IDs
    :language {
      :afrikaans {
        :south {
          :africa 0x0436}}
      :albanian {
        :albania 0x041c}
      :alsatian {
        :france 0x0484}
      :amharic {
        :ethiopia 0x045e}
      :arabic {
        :algeria 0x1401
        :bahrain 0x3c01
        :egypt 0x0c01
        :iraq 0x0801
        :jordan 0x2c01
        :kuwait 0x3401
        :lebanon 0x3001
        :libya 0x1001
        :morocco 0x1801
        :oman 0x2001
        :qatar 0x4001
        :saudi-arabia 0x0401
        :syria 0x2801
        :tunisia 0x1c01
        :uae 0x3801
        :yemen 0x2401}
      :armenian {
        :armenia 0x042b}
      :assamese {
        :india 0x044d}
      :azeri {
        :cyrillic {
          :azerbaijan 0x082c}
        :latin {
          :azerbaijan 0x042c}}
      :bashkir {
        :russia 0x046d}
      :basque {
        :basque 0x042d}
      :belarusian {
        :belarus 0x0423}
      :bengali {
        :bangladesh 0x0845
        :india 0x0445}
      :bosnian {
        :cyrillic {
          :bosnia-and-herzegovina 0x201a}
        :latin {
          :bosnia-and-herzegovina  0x141a}}
      :breton {
        :france 0x047e}
      :bulgarian {
        :bulgaria 0x0402}
      :catalan {
        :catalan 0x0403}
      :chinese {
        :hong-kong-sar 0x0c04
        :macao-sar 0x1404
        :people-republic-of-china 0x0804
        :singapore 0x1004
        :taiwan 0x0404}
      :corsican {
        :france 0x0483
        :croatia 0x041a
        :croatian {
          :latin {
            :bosnia-and-herzegovina 0x101a}}}
      :czech {
        :czech-republic 0x0405}
      :danish {
        :denmark 0x0406}
      :dari {
        :afghanistan 0x048c}
      :divehi {
        :maldives 0x0465}
      :dutch {
        :belgium 0x0813
       	:netherlands 0x0413}
      :english {
        :australia 0x0c09
        :belize 0x2809
        :canada 0x1009
        :caribbean 0x2409
        :india 0x4009
        :ireland 0x1809
        :jamaica 0x2009
        :malaysia 0x4409
        :new-zealand 0x1409
        :republic-of-the-philippines 0x3409
        :singapore 0x4809
        :south-africa 0x1c09
        :trinidad-and-tobago 0x2c09
        :united-kingdom 0x0809
        :united-states 0x0409
        :zimbabwe 0x3009}
      :estonian {
        :estonia 0x0425}
      :faroese {
        :faroe-islands 0x0438}
      :filipino {
        :philippines 0x0464}
      :finnish {
        :finland 0x040b}
      :french {
        :belgium 0x080c
        :canada 0x0c0c
        :france 0x040c
        :luxembourg 0x140c}
        :principality-of-monaco 0x180c
        :switzerland 0x100c}
      :frisian {
        :netherlands 0x0462}
      :galician {
        :galician 0x0456}
      :georgian {
        :georgia 0x0437}
      :german {
        :austria 0x0c07
        :germany 0x0407
        :liechtenstein 0x1407
        :luxembourg 0x1007
        :switzerland 0x0807}
      :greek {
        :greece 0x0408}
      :greenlandic {
        :greenland 0x046f}
      :gujarati {
        :india 0x0447}
      :hausa {
        :latin {
          :nigeria 0x0468}}
      :hebrew {
        :israel 0x040d}
      :hindi {
        :india 0x0439}
      :hungarian {
        :hungary 0x040e}
      :icelandic {
        :iceland 0x040f}
      :igbo {
        :nigeria 0x0470}
      :indonesian {
        :indonesia 0x0421}
      :inuktitut {
       	:canada 0x045d
        :latin {
          :canada 0x085d}}
      :irish {
        :ireland 0x083c}
      :isixhosa {
        :south-africa 0x0434}
      :isizulu {
        :south-africa 0x0435}
      :italian {
        :italy 0x0410
        :switzerland 0x0810}
      :japanese {
        :japan 0x0411}
      :kannada {
        :india 0x044b}
      :kazakh {
        :kazakhstan 0x043f}
      :khmer {
        :cambodia 0x0453}
      :k-iche {
        :guatemala 0x0486}
      :kinyarwanda {
        :rwanda 0x0487}
      :kiswahili {
        :kenya 0x0441}
      :konkani {
        :india 0x0457}
      :korean {
        :korea 0x0412}
      :kyrgyz {
        :kyrgyzstan 0x0440}
      :lao {
        :lao-pdr 0x0454}
      :latvian {
        :latvia 0x0426}
      :lithuanian {
        :lithuania 0x0427}
      :lower-sorbian {
        :germany 0x082e}
      :luxembourgish {
        :luxembourg 0x046e}
      :macedonian-fyrom {
        :former-yugoslav-republic-of-macedonia 0x042f}
      :malay {
        :brunei-darussalam 0x083e
        :malaysia 0x043e}
      :malayalam {
        :india 0x044c}
      :maltese {
        :malta 0x043a}
      :maori {
        :new-zealand 0x0481}
      :mapudungun {
        :chile 0x047a}
      :marathi {
        :india 0x044e}
      :mohawk {
        :mohawk 0x047c}
      :mongolian {
        :cyrillic {
          :mongolia 0x0450}
        :traditional {
          :people-republic-of-china 0x0850}}
      :nepali {
        :nepal 0x0461}
      :norwegian {
        :bokmal {
          :norway 0x0414}
        :nynorsk {
          :norway 0x0814}}
      :occitan {
        :france 0x0482}
      :odia-formerly-oriya {
        :india 0x0448}
      :pashto {
        :afghanistan 0x0463}
      :polish {
        :poland 0x0415}
      :portuguese {
        :brazil 0x0416}
      :portuguese {
        :portugal 0x0816}
      :punjabi {
        :india 0x0446}
      :quechua {
        :bolivia 0x046b}
      :quechua {
        :ecuador 0x086b}
      :quechua {
        :peru 0x0c6b}
      :romanian {
        :romania 0x0418}
      :romansh {
        :switzerland 0x0417}
      :russian {
        :russia 0x0419}
      :sami {
        :inari {
          :finland 0x243b}
        :lule {
          :norway 0x103b
          :sweden 0x143b}
        :northern {
          :finland 0x0c3b
          :norway 0x043b
          :sweden 0x083b}
        :skolt {
          :finland 0x203b}
        :southern {
          :norway 0x183b
          :sweden 0x1c3b}
        :sanskrit {
          :india 0x044f}}
      :serbian {
        :cyrillic {
          :bosnia-and-herzegovina 0x1c1a
          :serbia 0x0c1a}
        :latin {
          :bosnia-and-herzegovina 0x181a
          :serbia 0x081a}}
      :sesotho-sa-leboa {
        :south-africa 0x046c}
      :setswana {
        :south-africa 0x0432}
      :sinhala {
       	:sri-lanka 0x045b}
      :slovak {
      	:slovakia 0x041b}
      :slovenian {
       	:slovenia 0x0424}
      :spanish {
        :argentina 0x2c0a
        :bolivia 0x400a
        :chile 0x340a
        :colombia 0x240a
        :costa-rica 0x140a
        :dominican-republic 0x1c0a
        :ecuador 0x300a
        :el-salvador 0x440a
        :guatemala 0x100a
        :honduras 0x480a
        :mexico 0x080a
        :nicaragua 0x4c0a
        :panama 0x180a
        :paraguay 0x3c0a
        :peru 0x280a
        :puerto-rico 0x500a
        :spain {
          :modern 0x0c0a
          :traditional 0x040a}
        :united-states 0x540a
        :uruguay 0x380a
        :venezuela 0x200a}
      :sweden {
        :finland 0x081d}
      :swedish {
        :sweden 0x041d}
      :syriac {
        :syria 0x045a}
      :tajik {
        :cyrillic {
          :tajikistan 0x0428}}
      :tamazight {
        :latin {
          :algeria 0x085f}}
      :tamil {
        :india 0x0449}
      :tatar {
        :russia 0x0444}
      :telugu {
        :india 0x044a}
      :thai {
        :thailand 0x041e}
      :tibetan {
        :prc 0x0451}
      :turkish {
        :turkey 0x041f}
      :turkmen {
        :turkmenistan 0x0442}
      :uighur {
        :prc 0x0480}
      :ukrainian {
        :ukraine 0x0422}
      :upper-sorbian {
        :germany 0x042e}
      :urdu {
        :islamic-republic-of-:pakistan 0x0420}
      :uzbek {
        :cyrillic {
          :uzbekistan 0x0843}
        :latin {
          :uzbekistan 0x0443}}
      :vietnamese {
        :vietnam 0x042a}
      :welsh {
        :united-kingdom 0x0452}
      :wolof {
        :senegal 0x0488}
      :yakut {
        :russia 0x0485}
      :yi {
        :prc 0x0478}
      :yoruba {
        :nigeria 0x046a}}})

;; Name IDs: https://www.microsoft.com/typography/otspec180/name.htm § NameIDs
(def *name* [
  ;; The copyright string from the font vendor. © Copyright the Monotype Corporation plc, 1990
  "copyright"
  ;; The name the user sees. Times New Roman
  "familyname"
  ;; The name of the style. Bold
  "subfamilyname"
  ;; A unique identifier that applications can store to identify the font being used. Monotype: Times New Roman Bold:1990
  "unique_id"
  ;; The complete, unique, human readable name of the font. This name is used by Windows. Times New Roman Bold
  "full_name"
  ;; Release and version information from the font vendor. Version 1.00 June 1, 1990, initial release
  "version"
  ;; The name the font will be known by on a PostScript printer. TimesNewRoman-Bold
  "postscript_name"
  ;; Trademark string. Times New Roman is a registered trademark of the Monotype Corporation.
  "trademark"
  ;; Manufacturer. Monotype Corporation plc
  "manufacturer"
  ;; Designer. Stanley Morison
  "designer"
  ;; Description. Designed in 1932 for the Times of London newspaper. Excellent readability and a narrow overall width, allowing more words per line than most fonts.
  "description"
  ;; URL of Vendor. http://www.monotype.com
  "url_vendor"
  ;; URL of Designer. http://www.monotype.com
  "url_designer"
  ;; License Description. This font may be installed on all of your machines and printers, but you may not sell or give these fonts to anyone else.
  "license"
  ;; License Info URL. http://www.monotype.com/license/
  "url_license"
  ;; Reserved.
  "reserved"
  ;; Preferred Family. No name string present, since it is the same as name ID 1 (Font Family name).
  "preferred_familyname"
  ;; Preferred Subfamily. No name string present, since it is the same as name ID 2 (Font Subfamily name).
  "preferred_subfamilyname"
  ;; Compatible Full (Macintosh only). No name string present, since it is the same as name ID 4 (Full name).
  "compatible_full"
  ;; Sample text. The quick brown fox jumps over the lazy dog.
  "sample_text"
  ;; PostScript CID findfont name. No name string present. Thus, the PostScript Name defined by name ID 6 should be used with the “findfont” invocation for locating the font in the context of a PostScript interpreter.
  "postscript_cid"
  ;; WWS family name: Since Times New Roman is a WWS font, this field does not need to be specified. If the font contained styles such as “caption”, “display”, “handwriting”, etc, that would be noted here.
  "wws_familyname"
  ;; WWS subfamily name: Since Times New Roman is a WWS font, this field does not need to be specified.
  "wws_subfamilyname"
  ;; Light background palette name. No name string present, since this is not a color font.
  "light_background"
  ;; Dark background palette name. No name string present, since this is not a color font.
  "dark_background"
  ;; Variations PostScript name prefix. No name string present, since this is not a variable font.
  "variations_postscript"])
