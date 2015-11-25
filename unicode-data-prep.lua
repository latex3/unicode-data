--[[

  File unicode-data-prep.lua

  Copyright 2015 The TeX Users Group

--]]

-- Version information
local release_date    = "2015/11/24"
local release_version = "0.0"

-- File names
local east_asian_data = "EastAsianWidth.txt"
local line_break_data = "LineBreak.txt"
local unicode_data    = "UnicodeData.txt"

local unicode_casing = "unicode-casing.def"

-- OS-dependent line ending
if os.type == "windows" then
  newline  = "\r\n"
else
  newline  = "\n"
end

local data_files = {east_asian_data, line_break_data, unicode_data}

-- Check data files are available
do
  local file
  for _,file in pairs(data_files) do
    local f = io.open(file, "r")
    if f then
      io.close(f)
    else
      print("Cannot find data file \"" .. file .. "\"!")
      os.exit(1)
    end
  end
end

-- Set up for MD5 sums
-- Based on some ideas from Heiko Oberdiek's pdftexcmds
local function md_five(file)
  local f = io.open(file, "r")
  local contents = f:read("*a")
  return string.gsub(
    md5.sum(contents),
    ".",
    function(ch)
      return string.format("%02X", string.byte(ch))
    end
  )
end

-- http://snipplr.com/view/13086/number-to-hex/
local function int_to_hex(num)
  local hexstr = "0123456789ABCDEF"
  local s = ""
  while num > 0 do
    local mod = math.fmod(num, 16)
    s = string.sub(hexstr, mod + 1, mod + 1) .. s
    num = math.floor(num / 16)
  end
  if s == "" then s = "0" end
  return s
end

do
  -- Set up the header data
  local output = "This is the file \"" .. unicode_casing .. "\",\n"
    .. "generated using the script \"" .. arg[0] .."\".\n"
    .. "\n"
    .. "The data here are derived from the file\n"
    .. "- " .. unicode_data .. "\n"
    .. "  MD5 sum " .. md_five(unicode_data) .. "\n"
    .. "which is maintained by the Unicode Constortium.\n"
    .. "\n"
    .. "Generated on " .. os.date("%Y-%m-%d") .. "\n"
    .. "\n"
    .. "Copyright 2015 The TeX Users Group\n"
  -- Set up the comment chars
  output = "%% " .. string.gsub(output, "\n", newline .. "%%%% ") .. newline


  local range_start = nil
  local line
  for line in io.lines(unicode_data) do
    -- Extract the relevant data lines
    -- Done using a string simply to make the code a little more readable
    local data_pattern = "^([^;]+);([^;]+);([^;]+);"
      .. "[^;]*;[^;]*;[^;]*;[^;]*;[^;]*;[^;]*;[^;]*;[^;]*;[^;]*"
      .. ";([^;]*);([^;]*);.*$"
    local codepoint, desc, class, upper, lower =
      string.match(line, data_pattern)
    -- Make later testing easier
    if upper == "" then upper = nil end
    if lower == "" then lower = nil end

    -- Needed in a couple of places
    local function savedata(cs, codepoint, upper, lower)
      if not upper and not lower then
        output = output .. "\\l " .. codepoint .. newline
      elseif codepoint == upper and codepoint == lower then
        output = output .. "\\l " .. codepoint .. newline
      else
        output = output .. "\\" .. cs
          .. " " .. codepoint
          .. " " .. (upper and upper or codepoint)
          .. " " .. (lower and lower or codepoint)
          .. newline
      end
    end

    -- First check if we are looking for a line that ends a range
    if range_start then
      if string.match(class, "^L") then
        local i
        for i = tonumber(range_start, 16), tonumber(codepoint, 16) do
          -- Generate the appropriate non-cased letter
          output = output .. "\\l " .. int_to_hex(i) .. newline
        end
      end

      range_start = nil
    else
      -- If not, is this a line that starts a range?
      if string.match(desc, "First%>$") then
        range_start = codepoint
      else
        -- A single codepoint line
        -- Split letters (incl. marks) and none letters
        if string.match(class, "^L") or
           string.match(class, "^M") then
           savedata("L", codepoint, upper, lower)
        else
          -- Cased non-letters have at least one mapping
          if upper or lower then
            savedata("C", codepoint, upper, lower)
          end
        end
      end
    end
  end
  local output_file = io.open(unicode_casing, "w")
  io.output(output_file)
  io.write(output)
  io.close(output_file)
end
