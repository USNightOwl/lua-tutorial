function Sum(A, B)
  return A + B
end

local function Sub(A, B)
  return A - B
end

print("(module) A - B = " .. Sub(12, 5))


function Sub2(A, B)
  return Sub(A, B)
end

SUM = 12
local SUB = -5
