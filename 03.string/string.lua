Str = "ABC"
print(string.lower(Str))       -- abc
print(Str)                     -- ABC
Str = string.lower(Str)        -- ABC
Str = string.upper(Str)        -- abc

print(string.reverse("hello")) -- olleh
print(string.rep("hao", 3))    -- haohaohao

Str = "alphaBRAVOcharlie"
-- string.sub(string, start, end) (default end = length)
-- start and end can < 0 (length -> 0)
print(string.sub(Str, 2, 5))


-- get length string
print(#Str)            -- 17
print(string.len(Str)) -- 17

-- convert between Characters and Character codes
-- start, end (defaults end = start, start = 1)
-- Character -> ASCII code
print(string.byte("ABCDEF", 3))    -- 67
print(string.byte("ABCDEF", 2, 5)) -- 66    67    68    69
print(string.byte("ABCDEF"))       -- 65
-- ASCII code -> Character
print(string.char(65, 43))         -- A+



-----------------format-----------------
-- %number[s]:  print(number*space..s)
-- %-number[s]: print(s..number*space)
-- %d: interger, %s: string, %.3f
print(string.format("%-15s %d", "ABC", 12))
print(string.format("%s %6d", "ABC", 14))
print(string.format("%.0f | %10.1f | %.2f | %.3f", 99.44, 99.44, 99.44, 99.44))


-------------------------------gsub--------------------------------------
local gsub = string.gsub
Str = "The rain in Spain stays mainly in the plain."
print(gsub(Str, "ai", "oy"))
-- return string update and all position find this Characters
-- Res: The royn in Spoyn stays moynly in the ployn.    4
print(gsub(Str, "ai", "oy", 2))
-- Res: The royn in Spoyn stays mainly in the plain.    2
local newStr = gsub(Str, "ai", "")
print(newStr) -- new string


--------------------------Regex format simple-----------------------
--[[
  1. ^: start with
  2. .: any characters
  3. $: end with
  4. %: magic characters (^_^), such as /(/n, /t, //)
  5. %d: digit (43: %d%d, 5: %d)
  6. %a: letter (a..z, A..Z)
  7. %w: letter or number
  8. %z: match "\0" character
  9. %s: match white space
  10. %u, %l: uppercase/lowercase
  11. []: match in [] (ex: [abc] match a, b or c)([a-z][0-9])
  -- if you want a, z or -: [a%-z] or [az-]
  12. [^abc]: match any characters ~= a, b or c
  13. +: more or one character (ex: %s+)
]]
print(gsub("abcabc", "^ab", "HH"))                -- HHcabc   1
print(gsub("abcab", "ab$", "HH"))                 -- abcHH    1
print(gsub("90%, 100%, 110%", "110%%", "a lot!")) -- two % (magic char)
print(gsub("3^10", "%^", " to the power of "))    -- %^ to ^ (not Regex)

--[[
  Not all punctuation characters are magic, but a punctuation character (or any nonalphanumeric character) escaped by a percent sign always represents itself, whether it’s normally magic or not. In the following example, both “@” and “%@” match the at-sign, which is not magic
]]
print(string.gsub("somebody@example.com", "@", " AT "))
print(string.gsub("somebody@example.com", "%@", " AT "))
-- is same results

-------- use %a---------------------
print(gsub("abc4F!@<?|", "%a", "X")) -- letter (a..z, A..Z)


------ use [] -------------------
Str = "the quick / a \\ brown % fox jumps over - the lazy dog."
print(gsub(Str, "[/,.-\\]", ""))
print(gsub(Str, "[az-]", ""))
print(gsub(Str, "[a%-z]", "")) -- same below

------ use [^] -------------------------
Str = "the quick brown fox jumps over the lazy dog"
print(gsub(Str, '[^a-h]', "X")) -- all characters ~= a->h = X


---- use %u, %l -----------------------
Str = "abc Abc aBc abC ABc AbC aBC ABC"
print(gsub(Str, "%u%l %l", "Xxx")) -- Bc a -> Xxx


----- use %z ---------------------
print(string.gsub("a\0b\0c", "%z", " end ")) -- a end b end c       2


---- use %s , + ----------
print(gsub("X    + +       +      X", "+", "x"))     --- X   x x ...
print(gsub("X    + +       +      X+", "%s+", ""))   --- delete all space (4 deleted)
print(gsub("X    + +       +      X+", "%s++", "x")) --- == %s+%+
------> can use a+ (aaaaa), [ab]+(aaaa bbbb a b)



---------------------------- use %d, %w ----------------------
Str = "123 ABC 34 %aa$5^ @  sfd -%5dG = 0.5A"
print(gsub(Str, "%d%d", "X")) --X3 ABC X %aa$5^ @  sfd -%5dG = 0.5A     2
print(gsub(Str, "%w", "X"))   --XXX XXX XX %XX$X^ @  XXX -%XXX = X.XX   17
