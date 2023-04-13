print(print, _G.print)  -- same address
print(print, _G[print]) -- address    nil

MyGlobal = "Test1"
print(MyGlobal, _G.MyGlobal)          -- Test1     Test1
print(MyGlobal, _G["My" .. "Global"]) -- Test1     Test1
