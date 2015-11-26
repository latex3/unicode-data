The Unicode Consortium provide a range of data files detailing
the nature of code points in Unicode. These data files are
machine-readable but large. Here, a script is provided to
extract the relevant information for setting up case and
character class data in TeX in a format that is format-neutral
and rapidly parsable.

The extracted data is in two files:
- `unicode-casing.def`: Defines the mapping of code points to
  upper and lower case versions, including details of whether
  the code point is a cased letter, non-cased letter or cased
  non-letter. (Other code points are omitted.)
- `unicode-classes.def`: Defines the character class for
  letters.

Script usage
============

The script should be run using a Lua interpreter and has been
tested using `texlua` in TeX Live 2015. There are no command
line options.

Before running the script, download the data files
 - `UnicodeData.txt`
 - `EastAsianWidth.txt`
 - `LineBreak.txt`
from the Unicode Consortium
(ftp://ftp.unicode.org/Public/UNIDATA/) and place them in the
same directory as the script. The files should be downloaded
preserving the Unix (LF) line endings.

File `unicode-cases.def`
========================

This file contains data extracted from `UnicodeData.txt` and is
concerned with cased and caseless letters along with cased
non-letter characters. Each data line begins with one of
 - `\L` A cased letter
 - `\l` A caseless letter
 - `\m` A (caseless) combining mark
 - `\C` A cased non-letter
Lines for cased characters then contain three hexadecimal
values: the code point, the corresponding upper case code point
and the corresponding lower case code point, separated by
spaces. Lines for caseless characters contain a single
hexadecimal value, the code point itself.

Characters are defined as letters, combining marks or otherwise
in the file `UnicodeData.txt`, and this information is used
directly. Cased non-letters are identified as they have a
distinct upper or lower case mapping. In the same way, cased
letters are identified as at least on of the upper or lower case
mappings is given and is not the code point itself. There are no
cased combining marks.

File `unicode-classes.def`
==========================

This file contains data extracted from `EastAsianWidth.txt` and
`LineBreak.txt` and is concerned with the different classes of
character that can be identified. This information is needed for
line breaking in scripts which do not have spaces between words.
Each data line begins with one of
 - `\ID` Ideographic
 - `\CL` Close Punctuation
 - `\EX` Exclamation/Interrogation
 - `\IS` Infix Numeric Separator
 - `\NS` Nonstarter
 - `\OP` Open Punctuation
 - `\CM` Combining Mark
all of which are described by the Unicode Consortium. Lines for
ideographs are then followed by two code points: the start and
end values for a range to which this description applies. All
other lines contain exactly one code point after the class
description. Separation of the code point from the class and between
the code points is achieved by a space.

All ideographic code points are recorded in the data file. Other
classes are recorded if they have East Asian width type "F", "H"
or "W" (full-, half- and wide-width).

Issues and improvements
=======================

Any issues with the `.def` files should be addressed by updating
the generator script. The home page for this bundle is
https://github.com/josephwright/unicode-data, and issues may be
reported there.

License and permission
======================

This bundle is copyright 2015 The TeX Users Group.

You may freely use, modify and/or distribute the files provided
here, subject only to the conditions which apply to the source
data.

The data used to generate the `.def` files is provided by the
Unicode Consortium, and the following following notice applies.

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
