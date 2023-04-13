------------------------ For -------------------------
--[[
  for variable = start number, end number, step do
        zero or more statements
  end
]]
-- for to
--- integer
for i = 1, 10, 1 do
  io.write(i .. " ")
end     -- 1 2 3 4 5 6 7 8 9 10
print() -- new line

-- double
for i = -8, 7.5, 2.4 do
  io.write(i .. ", ") -- -8.0, -5.6, -3.2, -0.8, 1.6, 4.0, 6.4,
end
print()

-- for downto
for i = 10, 3, -2 do
  io.write(i .. " ") -- 10 8 6 4
end
print()

-- change value in for loop
End = 5
for i = 1, End do -- i: 1 -> 5 (default although End change in loop )
  End = End - 1
  print("I is " .. i .. ' End is ' .. End)
end
--[[ Results:
  I is 1 End is 4
  I is 2 End is 3
  I is 3 End is 2
  I is 4 End is 1
  I is 5 End is 0
]]
-- for loop inside for loop
M = 3
N = 2
for i = 1, M do
  for j = N, 1, -1 do
    print("Outer: " .. i .. ", Inner: " .. j)
  end
end

-- loop variable
N = "Outside loop"
for N = 1, 3 do
  io.write(N .. " ")
end      -- 1 2 3
print(N) -- Outside loop
----> Because N in loop (local variable) ~= N outside loop


-- use break and do statements
for i = 1, 10, 1 do
  print("Before")
  do break end -- or break only
  print("After")
end
