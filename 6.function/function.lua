-- function return void()
function Hello() -- Should uppercase (ex: Hello, _Hello,...)
  print("Hello guy")
end

function Hello() -- re function (same name function)
  print("Hello boy")
end

function Hello2(name) -- dont use Hello(name) =))
  print("Hello " .. name)
end

function Hello3(name)
  if name == 'Hao' then
    print("Ohh My friend Hao!!!")
  else
    print("Hello " .. name)
  end
end

Hello()
Hello2("Hao")
Hello2("Nhat")
Hello3("Hao")
Hello3("Paht")

-- function return value
function Sum(a, b)
  if b == nil then
    b = 0
  end
  if a == nil then
    a = 0
  end
  return a + b
end

print(Sum(3))                    -- 3
print(Sum(3, 5))                 -- 8
print(Sum(Sum(1, 2), Sum(4, 3))) -- 10

--EvenLen function
function EvenLen(str)
  if #str % 2 == 0 then
    return true
  end
  return false
end

print(EvenLen("Hao"), EvenLen("Nhat")) -- false      true
print(type(EvenLen))                   -- function

-- fucntion return mutilple values
function ReturnArg(Arg1, Arg2, Arg3)
  return Arg1, Arg2, Arg3
end

print(ReturnArg(1, 2, 3))    -- 1     2     3
print(ReturnArg(1, "alpha")) -- 1   alpha   nil

A, B, C = ReturnArg("alpha", "beta", "gamma")
print(A .. " " .. B .. " " .. C) -- alpha beta gamma

-- Using Multiple-Valued Functions in Value Lists
print(1, ReturnArg(1, 2))                           -- 1      1     2     nil
print(ReturnArg(1, 2), 3)                           -- 1      3
print(ReturnArg(1, 2, 3), ReturnArg("A", "B", "C")) -- 1    A     B     C

A, B, C, D, E = ReturnArg(1, 2, 3), ReturnArg(4, 5, 6)
print(A, B, C, D, E) -- 1     4      5       6       nil
-- Nothing functions
function Nothing()

end

A, B, C, D = Nothing(), ReturnArg(1, 2, 3), 4
print(A, B, C, D) -- nil    1   4   nil

--[[
  If a function call is the last (or only) expression in a value list, then all (if any) values
returned by the function are used. If a function call is in a value list but is not the
last expression, then its first return value (or nil, if it returns nothing) is used and
any remaining return values are discarded.
]]
---------------------------
-- To force a function call at the end of a value list to be adjusted to one value, surround the whole function
-- call (including its parentheses) with parentheses:
print("a", (ReturnArg("b", "c", "d"))) --     a       b
