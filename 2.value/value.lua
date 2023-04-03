--[[
  global value should start with uppercase character
  EX: Pass, A, B, C, ...
]]
--nil value
Pass = nil        -- nil cant use .. ex: print(Pass.." ") -- error!!!
print(Pass)
A, B, E, F = 1, 2 -- <=> 1, 2, nil, nil
print(A, B, E, F)

--nil is none type
print(nil ~= false and nil ~= 0 and nil ~= "nil") -- true

-- compare two variable
MaxLoginCount = 100
LoginCount = 50
print(MaxLoginCount > LoginCount)

--boolean
print(false and false) -- false
print(false and true)  -- false
print(true and false)  -- false
print(true and true)   -- true

print(false and nil)   -- false
print(nil and false)   -- nil
print(0 and true)      -- true
print(true and 0)      -- 0

--[[
  Remember, false and nil are the two false values, and every other value is a true
value. This means that, unlike some other languages, the number 0 and the empty
string are both true.
]]
print(FavoriteFruit or 'apple') -- FavoriteFruit is nil => apple
FavoriteFruit = 'kiwi'
print(FavoriteFruit or 'apple') -- FavoriteFruit is not nil => FavoriteFruit

Choice1, Choice3, Choice2 = nil, "pencil", 'pen'
print(Choice1 or Choice2 or Choice3)

-- use ?:
Str1, Str2 = "aardvark", "zebra"
print(Str1 < Str2 and Str1 .. Str2 or Str2 .. Str1)

-- value more than variable
Val1, Val2 = "Hi", "Hello", "AK47"
print(Val1, Val2) -- Hi     Hello
-- variable more than value
Val1, Val2, Val3 = "Hi", "Hello"
print(Val1, Val2, Val3) -- Hi     Hello     nil
-- dont use .. with nil value


-- local variables
print("Local variable")
Arg, NotShadowed = "Outside 1", "Outside 2"
function ScopeTest(Arg)
  print(Arg, NotShadowed)
end

ScopeTest(true)         -- true     Outside 2
print(Arg, NotShadowed) -- Outside 1      Outside 2

--- function ScopeTest3
function ScopeTest3(Lc1)
  for _ = 1, 5 do
    Lc1 = Lc1 .. "a" -- a -> aaaaa
    print(Lc1)
    local Lc1 = ""
    Lc1 = Lc1 .. "z" -- z (only)
    print(Lc1)
  end
  print("Loop done!!!")
  print(Lc1) -- aaaaa
end

ScopeTest3("")


-- Test 2
do
  local A = "A1"
  do
    local B = "B1"
    do
      local A = "A2"
      do
        local B = "B2"
        B = "still B2"
      end
      do
        local C = "C1"
        print(A, B, C)
      end
    end
  end
end
-- A2       B1        C1

--- Test 3
Tc1 = "JQK"
do
  Tc1 = "Q"           -- global
  local Tc1 = Tc1 .. "ABCD"
  Tc1 = Tc1 .. "abcd" -- or dont use local
  print(Tc1)          -- QABCDabcd
end
print(Tc1)            -- Q
