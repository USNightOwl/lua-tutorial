-- run terminal text 1: lua54 args.lua this is text 123
-- or text2: lua54 args.lua "this is text" 23 "heelo"
print(...)
-- this     is     text    123
-- this is text    23      heelo

Count = select("#", ...)
print(Count) -- 4/3


A = { ... } -- table
print(table.concat(A, ', '))
-- this, is, text, 23
-- this is text, 23, heelo

---------------More---------------
--[[
  1. lua54 -v: version current use lua54,
  results: Lua 5.4.2  Copyright (C) 1994-2020 Lua.org, PUC-Rio
  2. lua54 -e "print('Hello')": execute argument as Lua code

]]
