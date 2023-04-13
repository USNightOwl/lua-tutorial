function MakeLessThan(N)
  return function(X)
    return X < N
  end
end

LessThanFive = MakeLessThan(5)
LessThanTen = MakeLessThan(10)
print(LessThanFive(4))
print(LessThanFive(12))
print(LessThanTen(4))
print(LessThanTen(12))
-- other way
print(MakeLessThan(9)(5))


--function in function
function MakeGetAndInc(N)
  -- Get N
  local function Get()
    return N
  end

  -- Increments N By M
  local function Inc(M)
    N = N + M
  end

  return Get, Inc
end

--use func
GetA, IncA = MakeGetAndInc(0)
GetB, IncB = MakeGetAndInc(10)
print(GetA())
print(GetB())

IncA(5)
print(GetA())
IncA(4)
print(GetA())


--- Figuring Out Tricky Scope Situations
function One()
  return 1
end

function Two()
  return 2
end

print("More")
for i = 1, 5, 1 do
  if i % 2 == 0 then
    function One() -- define again function One()
      return i * 2
    end
  else
    function Two() -- define again function Two()
      return i * 3
    end
  end
  print(i .. " " .. One())
  print(i .. " " .. Two())
end
print(One())
print(Two())
