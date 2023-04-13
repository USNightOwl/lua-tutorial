------------------------ While -------------------------
--[[
  while an expression do
      zero or more statements
  end
]]
N = 0
while N < 10 do
  io.write(N .. " ")
  N = N + 1
end -- 0 1 2 3 4 5 6 7 8 9
print()

-- calc factorials use while
N = 0
while N <= 5 do
  local f, i = 1, 1
  while i <= N do
    f = f * i
    i = i + 1
  end
  print(N .. "! = " .. f)
  N = N + 1
end
