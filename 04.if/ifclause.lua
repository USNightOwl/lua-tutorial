-- use condition ? condition = true : condition = false
Str1, Str2 = "aardvark", "zebra"
print(Str1 < Str2 and Str1 .. Str2 or Str2 .. Str1)

-- If clause
print("If clause")
if Str1 < Str2 then
  -- do something here
  print(Str1 .. Str2)
end

-- else
print("If, else clause")
A, B = 10, 24
if A > B then
  -- do something here
  print("A > B")
  C = A - B
else
  -- do something here
  print("A <= B")
  C = B - A
end
print("C = " .. C)

-- else if
print("If, else if and else clause")
A, B = 24, 24
if A > B then
  -- do something here
  print("A > B")
  C = A - B
elseif A == B then
  -- do something here
  print("A = B")
  C = 0
else
  -- do something here
  print("A < B")
  C = B - A
end
print("C = " .. C)

-- Example
N = 3
if N == 1 then
  print("N is one")
elseif N == 2 then
  print("N is two")
elseif N == 3 then
  print("N is three")
else
  print("N is neither one nor two nor three")
end
