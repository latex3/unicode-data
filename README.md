The Unicode Consortium provide a range of data files detailing
the nature of codepoints in Unicode. These data files are
machine-readable but large. Here, a script is provided to extract
the relevant information for setting up case and character class
data in TeX in a format that is format-neutral and rapidly
parsable.

The extracted data is in two files:
- `unicode-casing.def`: Defines the mapping of code points
   to upper and lower case versions, including details of
   whether the code point is a cased letter, non-cased letter
   or cased non-letter. (Other codepoints are omitted.)
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

This file contains data extracted from `UnicodeData.txt`
and is concerned with cased and caseless letters along with
cased non-letter characters. Each data line begins with one of
 - `\L` A cased letter
 - `\l` A caseless letter
 - `\C` A cased non-letter
Lines for cased characters then contain three hexidecimal
values: the codepoint, the corresponding upper case codepoint
and the corresponding lower case codepoint, separated by spaces.
Lines for caseless letters contain a single hexidecimal value,
the codepoint itself.
