#!/usr/bin/env texlua

-- Identify the bundle and module
bundle = ""
module = "unicode-data"

-- Non-standard installation
installfiles = {"load-unicode-*.tex", "*.txt"}

-- Nothing to typeset or unpack
sourcefiles  = installfiles
textfiles    = {"*.md"}
typesetfiles = { }
unpackfiles  = { }

-- Non-standard installation root
tdsroot = "generic"

-- Release a TDS-style zip
packtdszip  = true

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))
