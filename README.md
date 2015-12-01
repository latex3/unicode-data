The Unicode Consortium provide a range of data files detailing
the nature of code points in Unicode. These data files are
machine-readable but large. Here, a set of loaders are provided
to parse these files during a TeX run and set appropriate
parameters in an automated fashion.

File `load-unicode-casing.tex`
==============================

This file parses `UnicodeData.txt`, provided by the Unicode
Consortium, and when used with a Unicode-capable engine sets the
following TeX properties:
- `\catcode` 11 for all letters (Unicode class "L")
- `\catcode` 11 for all combining marks (Unicode class "M")
- `\sfcode` 999 for all code points of class Lu (upper case
  letters)
- `\lccode` for all of class Ll (upper case letters) to the code
  point itself, and `\uccode` to the upper case mapping (or if
  not given to the code point itself)
- `\uccode` for all of class Lu (upper case letters) to the code
  point itself, and `\lccode` to the lower case mapping (or if
  not given to the code point itself)
- `\lccode` and `\uccode` for all of class Lt (title case
  letters) to the lower can upper case mappings (or if not given
  to the code point itself)
- `\lccode` and `\uccode` for all other letter code points are
  set to the code point itself
- `\lccode` and/or `\uccode` for non-letter code points for
  which an upper or lower case mapping is given

File `load-unicode-classes.tex`
==========================

This file parses `EastAsianWidth.txt` and `LineBreak.txt`,
provided by the Unicode Consortium, and when used with XeTeX
sets `\XeTeXcharclass` for the following classes of code point:
- "ID" (ideographic) are class 1
- "OP" (opener) are class 2
- "CL" (closer), "NS" (non-starter), "EX" (exclamation) and "IS"
  (infix separator) are class 3
- "CM" (combining marks) are class 256 (transparent to the
  inter-character token register mechanism)

All code points of type "ID" are set to class 1, other code
points are only set where they fall into east Asian width type
"F", "H" or "W" (full-, half- and wide-width).

Issues and improvements
=======================

Any issues with the `.def` files should be addressed by updating
the generator script. The home page for this bundle is
https://github.com/latex3/unicode-data, and issues may be
reported there.

License and permission
======================

This bundle is copyright 2015 The LaTeX3 Project

You may freely use, modify and/or distribute the files provided
here, subject only to the conditions which apply to the source
data (`.txt` files), to which the following notice applies.

COPYRIGHT AND PERMISSION NOTICE

Copyright © 1991-2015 Unicode, Inc. All rights reserved.
Distributed under the Terms of Use in 
http://www.unicode.org/copyright.html.

Permission is hereby granted, free of charge, to any person
obtaining a copy of the Unicode data files and any associated
documentation (the "Data Files") or Unicode software and any
associated documentation (the "Software") to deal in the Data
Files or Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish,
distribute, and/or sell copies of the Data Files or Software,
and to permit persons to whom the Data Files or Software are
furnished to do so, provided that
(a) this copyright and permission notice appear with all copies
of the Data Files or Software,
(b) this copyright and permission notice appear in associated
documentation, and
(c) there is clear notice in each modified Data File or in the
Software as well as in the documentation associated with the
Data File(s) or Software that the data or software has been
modified.

THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT
WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS
NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR
CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
CONNECTION WITH THE USE OR PERFORMANCE OF THE DATA FILES OR
SOFTWARE.

Except as contained in this notice, the name of a copyright
holder shall not be used in advertising or otherwise to promote
the sale, use or other dealings in these Data Files or Software
without prior written authorization of the copyright holder.
