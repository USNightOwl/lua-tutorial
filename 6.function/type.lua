print(type(43))             -- number
print(type("Hello guy"))    -- string
print(type(true))           -- boolean
print(type(nil))            -- nil
print(type(type(43)))       -- string
print(type(type(nil)))      -- string
print(type(type(type(43)))) -- string

Some = type(42)
print(Some == 'number') -- true

A = 123
print(type(A)) -- number
