#!/usr/bin/env texlua

-- Identify the bundle and module
bundle = ""
module = "unicode-data"

-- Non-standard installation
installfiles = {"*.def", "*.tex", "*.txt"}

-- Nothing to typeset or unpack
sourcefiles  = installfiles
textfiles    = {"*.md"}
typesetfiles = { }
unpackfiles  = { }

-- Testing
checkformat  = "tex"
checkengines = {"xetex", "luatex"}
stdengine    = "xetex"

-- Non-standard installation root
tdsroot = "generic"

-- Release a TDS-style zip
packtdszip  = true

-- Tagging
tagfiles = {"load-unicode-*.tex"}
function update_tag(file,content,tagname,tagdate)
  return string.gsub(content,
    "v%d%.%d.? %(%d%d%d%d%-%d%d%-%d%d%)",
    tagname .. " (" .. tagdate .. ")")
end

function tag_hook(tagname)
  os.execute('git commit -a -m "Step release tag"')
  os.execute('git tag -a -m "" ' .. tagname)
end

-- Find and run the build system
kpse.set_program_name("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
