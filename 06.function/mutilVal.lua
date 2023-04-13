--- example 1
function Average(...)
  print(...)
end

Average(1, 2, 3) --- 1     2     3

--- example 2
function Average(...)
  local Ret, Count = 0, 0
  for _, value in ipairs({ ... }) do
    Ret = Ret + value
    Count = Count + 1
  end
  assert(Count > 0, "dont divide for Zero") -- raise error if condition false with message
  return Ret / Count
end

-- print(Average()) -- error
print(Average(1, 2, 4))

-- with arguments
function F(arg1, arg2, ...)
  print("Arg1 and Arg2: ", arg1, arg2)
  if #{ ... } ~= 0 then -- have other arguments
    print("The rest: ", ...)
  end
end

F()                        --nil   nil
F("a")                     -- a     nil
F("a", "b")                -- a      b
F("a", "b", "c")           -- a   b
F("a", "b", "c", "d", "e") -- a   b
