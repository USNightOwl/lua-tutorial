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
