NameToInstr = {
  ["John"] = "rhythm guitar",
  ["Paul"] = "bass guitar",
  ["Geogre"] = "lead guitar",
  ["Ringo"] = "drumkit"
}

print(NameToInstr["John"]) -- rhythm guitar
print(NameToInstr["Mick"]) -- nil


-- any value, key (type not (key is nil))
T = {
  [print] = "the print function",
  ["print"] = print,
  [0.1] = 0.2,
}

print(T["print"])
print(T[print])

-- shorter way key: value
NameToInstr = {
  John = "ABC John",
  Paul = "DEF Paul",
  print = "Hell",
  ab = 12,
}

print(NameToInstr["John"])
print(NameToInstr['ab'])

--other way call
print(NameToInstr.Paul)

--- mutil table in table
Tb1 = {
  Tb2 = {
    [print] = "Print function",
    John = "Hello John"
  },
  ["Tb3"] = {
    [12] = 0.3,
    [0.5] = type(0.5),
    ["Paul"] = print
  },
  Tb4 = "End table"
}

print(Tb1.Tb2.John)       -- Hello John
print(Tb1["Tb2"][print])  -- Print function
print(Tb1["Tb3"]["Paul"]) -- function: address
print(Tb1.Tb3[0.5])       -- number
print(Tb1.Tb4)            -- End table

-- change value in table
Potluck = {
  John = "chips",
  Jane = "lemonade",
  Jolene = "egg salad"
}
Potluck.John = nil
Potluck["Jane"] = "fruit salad"
print(Potluck.John, Potluck.Jane, Potluck.Jolene)

-----------------------Table as array---------------------
Squares = {}
for i = 1, 5 do
  Squares[i] = i ^ 2
end
for i = 1, 5 do
  io.write(Squares[i] .. ' ')
end

-- array Month
print()
Months = {
  [1] = "T1",
  [2] = "T2",
  [3] = "T3",
  [4] = "T4"
}
print(Months[1])

-- other way simple
Months = {
  "T1", "T2", "T3", "T4"
}
print(Months[3])

--[[
  Inside a table constructor, the first value that doesn’t have a key (and an equal sign) in front of it is associated with the key 1. Any subsequent such values are given a key one higher than that given to the previous such value. This rule applies even if key-value pairs with equal signs are intermixed, like This
]]
T = { A = "x", "one", B = "y", 'two', C = "z", "three" }
print(T[3])
print(#T) -- 3
A = "A"
print(T[A])

-- function
function ReturnThreeVals()
  return "x", "y", "z"
end

TblA = { ReturnThreeVals(), ReturnThreeVals() }
print(TblA[1], TblA[2], TblA[3], TblA[4], TblA[5], TblA[6])
-- x      x       y       z       nil       nil

print(#TblA) -- 4

--- nil value in table
T2 = { "a", "b", nil, nil, "e" } -- Gap between element 2 and
print(#T2)                       -- 5
T3 = { "a", "b", nil, nil }
print(#T3)                       -- 2

-- using ipairs (for array)
Squares = {}
for i = 1, 5 do
  Squares[i] = i ^ 2
end
for i, Square in ipairs(Squares) do -- if dont use i -> _ (like python)
  print(i .. " squared is " .. Square)
end

-- use pairs (for all key)
-- random choice key
T = { Gleep = "hello",[1] = 12, Gloop = "hi",[3] = 15 }
for index, value in pairs(T) do
  print(index, value)
end

-- value in table is function
Numbers = { "one", "two", "three" }
Prenumber = {}
for Num, NumName in ipairs(Numbers) do
  Prenumber[Num] = function(Str)
    return NumName .. ": " .. Str
  end
end

print(Prenumber[2]("is company"))


-- value is table
NamesAndIns = {
  { Name = "John",  Instr = "John guitar" },
  { Name = "Paul",  Instr = "Paul guitar" },
  { Name = "Ringo", Instr = "Ringo guitar" }
}

for _, NameInstr in ipairs(NamesAndIns) do
  print(NameInstr.Name .. " played " .. NameInstr["Instr"])
end



------------------Library----------------------
---- Sort
Names = { "Scarlatti", "Telemann", "Corelli", "Purcell",
  "Vivaldi", "Handel", "Bach" }
table.sort(Names)
for i, Name in ipairs(Names) do
  print(i, Name)
end

--- sort have condition
-- A demonstration of sorting an associative table.
NameToInstr = {
  John = "rhythm guitar",
  Paul = "bass guitar",
  George = "lead guitar",
  Ringo = "drumkit"
}
-- Transfer the associative table NameToInstr to the
-- array Sorted:
Sorted = {}
for Name, Instr in pairs(NameToInstr) do
  table.insert(Sorted, { Name = Name, Instr = Instr })
end
-- The comparison function sorts by Name:
table.sort(Sorted, function(A, B) return A.Name < B.Name end)
-- Output:
for _, NameInstr in ipairs(Sorted) do
  print(NameInstr.Name .. " played " .. NameInstr.Instr)
end



-----------------Concat-----------------
--[[
  table.conact(list, sep, i, j) (dk: i <= j)
  --> list[i]..sep..list[i+1]..sep..list[j]
  If the third argument is greater than the fourth argument, the empty string is returned
]]
T = { "a", "bc", "d", 12, "e", 0.5 }
A = table.concat(T) -- type(A) == string
print(A)            -- abcd12e0.5
A = table.concat(T, ', ')
print(A)            -- a, bc, d, 12, e, 0.5
A = table.concat(T, "", 2, 4)
print(A)            -- bcd12
A = table.concat(T, nil, nil, 4)
print(A)            -- abcd12


----------------Remove-------------------
function PrintStr(Arr)
  return table.concat(Arr, ', ')
end

T = {}
table.insert(T, "a")
table.insert(T, "b")
table.insert(T, "c")
print(#T)
print(PrintStr(T))      -- a, b, c
table.remove(T, 2)
print(PrintStr(T))      -- a, c
table.insert(T, 2, "b") -- insert index 2
print(PrintStr(T))      -- a, b, c
table.remove(T)         -- remove length
print(PrintStr(T))      -- a, b
print(#T)               -- 2

NameToInstr = {
  John = "ABC John",
  Paul = "DEF Paul",
  "one",
  print = "Hell",
  ab = 12,
  "two"
}
print(PrintStr(NameToInstr)) -- one, two
