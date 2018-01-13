# Image3font
A image's converter to font written in Fontforge/FontTools's Hy script.

[![travis-badge][]][travis] [![license-badge][]][license]

[travis-badge]: https://travis-ci.org/adjivas/Image3font.svg?branch=master&style=flat-square
[travis]: https://travis-ci.org/adjivas/Image3font
[license-badge]: http://img.shields.io/badge/license-GPLv3-blue.svg?style=flat-square
[license]: https://github.com/limaconoob/Image2font/blob/master/LICENSE

### Usage

### Manifest
The image3font.toml file for each font is called its manifest. Every manifest file consists of two fields and two sections.

#### The *path* field (optional)
#### The *source* field (default = "src")
The *source* field can be used to configure the SVG's directory, 
#### The [fontforge] section
##### The *path* field
##### The *fontname* field
The name contained in the postscript FontName field.
##### The *familyname* field (default = "fontname")
The name contained in the postscript FamilyName field.
If not specified this will be inferred as *fontname*
##### The *fullname* field (default = "fontname")
The name contained in the postscript FullName field
If not specified this will be inferred as *fontname*
##### The *weight* field (optional)
The name contained in the postscript Weight field
##### The *copyright* field (optional)
The name contained in the postscript Notice field
##### The *version* field (optional)
##### The *encoding* field (default = "UnicodeFull")
##### The *em* field (default = 2028)
#### The [fonttools] section

### License

**image3font**'s code in this repo uses the [GNU GPL v3](http://www.gnu.org/licenses/gpl-3.0.html) [license](https://raw.githubusercontent.com/adjivas/Image3font/master/LICENSE).

#### Dependencies
Many thanks goes to **command/etc**'s project:
* [FontForge](https://github.com/fontforge/fontforge)
* [FontTools](https://github.com/fonttools/fonttools)
* [Wand](https://github.com/dahlia/wand)
* [Wikipedia (for the picture **neko**!)](https://en.wikipedia.org/wiki/Catgirl)
