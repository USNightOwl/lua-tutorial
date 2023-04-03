--[[
  select(index, ...args) => returns args[index:end]
  if index > end: dont have any
  if index < 0: index = end - abs(index) + 1 (like python)
  if index == '#': count(args)
]]
print(select(1, "a", "b", "c", "d", "e"))   -- a     b     c     d    e
print(select(2, "a", "b", "c", "d", "e"))   -- b     c     d    e
print(select(-2, "a", "b", "c", "d", "e"))  -- d     e
print(select(9, "a", "b", "c", "d", "e"))   --
print(select("#", "a", "b", "c", "d", "e")) -- 5
print(select("#", "a", nil, nil))           -- 3


-- function count args
function F(...)
  io.write(select("#", ...) .. " ")
  -- or
  print(#{ ... }) -- dont count end if is nil
end

F('a', 'b', nil, 'c', nil, nil, 'd') -- 7 7
F('a', nil, 'b', 'c', nil, nil)      -- 6 4
