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
