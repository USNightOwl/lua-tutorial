--[[
  this is command mutil line
]]
--comand one line

print(1 + 2)
print("Hello world")
print(2 ^ 2) -- result double
print(5e4)   -- 5*10^4
print(2 ^ -4)
print(5e-4)
print(100 / 4)    -- double
print(26 % 4)     -- integer
print("2" + "22") -- result 24
print("10" - "4") -- result 6
print(0xFF)       -- integer 255 (decimal)

-- use variable
X = "nguyen"                     -- global value should named uppercase (ex: A, B, C)
print(X)
A, B = 1, 2                      -- global value should named uppercase (ex: A, B, C)
print(A .. " " .. B)             -- .. use to connect
A, B = B, A                      -- swap (A, B)
print(A .. " " .. B)             -- .. use to connect
C = 13
A, B, C = C, A, B                -- same
print(A .. " " .. B .. " " .. C) -- .. use to connect

-- use write
io.write("hello")  -- dont create new line
io.write(" world") -- results hello world

-- bool
print()         -- create new line
BC = 12
print(BC > 10)  -- true
print(BC < 5)   -- false
print(BC == 12) -- true
print(BC ~= 12) -- != false

-- variable Num ~= num ~= nUM
-- print mutil line (use [[your string]])
print([[There are some
funky '\" character
in this string.]])
print([=[Here ]] are some square brackets.]=]) -- your string have ]],[[
print([==[babble ]=] burble]==])               -- or more ==

-- use backlash Escaping
print("Cry \"Havoc\"")
print("1 backslash: \\ 2: \\\\ 3: \\\\\\")
-- new line or use \n
print("one\
two")
