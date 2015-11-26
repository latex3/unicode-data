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
