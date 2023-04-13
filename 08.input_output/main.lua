--- Input/Output use console
io.write("Input n = ")  -- inline
N = io.read()           -- read
print("Your N = " .. N) -- output with end line

---- Input/Output use file
print("FILE")
-- read file
FileHnd, ErrStr = io.open("INPUT.TXT", "r")
N = FileHnd:read()
print(N)        -- type(N) == string
N = tonumber(N) -- 45 type(N): number
FileHnd:close()
-- write file
FileHnd, ErrStr = io.open("OUTPUT.txt", "w")
FileHnd:write(N + 15) -- 60
FileHnd:close()
-- read file mutil line
FileHnd, ErrStr = io.open("INPUT.TXT", "r")
print(FileHnd:read())        -- 45
print(FileHnd:read())        -- 4
print(FileHnd:read())        -- 23
FileHnd:close()
print(os.remove("text.txt")) -- delete file return true/(nil with message)

-- 215(186)
