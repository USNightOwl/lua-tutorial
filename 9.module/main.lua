----> run this file: lua54 main.lua

require('./sum') -- print(A - B = 7) -- before
require("sum2")
require("./namespace")

print("(main) A + B = " .. Sum(12, 5))
-- print("(main) A - B = " .. Sub(10, 5)) --error because Sub is local function
print("(main) A - B = " .. Sub2(10, 5))


--- call value in module
print("SUM = " .. SUM)
-- print("SUB = " .. SUB) error(or nil) because SUB is local variable in file sum.lua

print(_G.Sum, _G.SUM) -- global state


------------------file sum2.lua--------------------------
print(Sum2(12, 4))
print(Sum3(12, 5))


------ namespace---------------
print(Util.quote("hello"))
print(string.quote("Hao"))
