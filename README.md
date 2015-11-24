The Unicode Consortium provide a range of data files detailing
the nature of codepoints in Unicode. These data files are
machine-readable but large. Here, a script is provided to extract
the relevant information for setting up case and character class
data in TeX in a format that is format-neutral and rapdily
parsable.

The extracted data is in two files:
- `unicode-casing.def`: Defines the mapping of code points
   to upper and lower case versions, including details of
   whether the code point is a cased letter, non-cased letter
   or cased non-letter. (Other codepoints are omitted.)
- `unicode-classes.def`: Defines the character class for
  letters.
