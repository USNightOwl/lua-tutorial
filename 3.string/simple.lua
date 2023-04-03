-- connact string
OneAndTwoThree, OneTwoAndThree = "1" .. "23", "12" .. '3'
print(OneAndTwoThree, OneTwoAndThree)
print(OneAndTwoThree == OneTwoAndThree)

print("abcd" .. "" == "abcd")

-- get length string
io.write(#"" .. " ")   -- 0
io.write(#"\n" .. " ") -- 1
print(#"hello")        -- 5
Verb = "hello guy"
print(#Verb)           -- 9
print(#"fi__o")

-- Lua counts the null byte just like any other character:
NullByte = "\0"                   -- end string character
NullBytes = NullByte .. NullByte .. NullByte
print(#NullByte)                  -- 1
print(#NullBytes)                 -- 3
print(#"before\0between\0behind") -- 21

--[[
  Lua 5.0 didn’t have the length operator #. To get the length of a string, use the function string.len;
to get the length of a table, use the function table.getn.
]]
