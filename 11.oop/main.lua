Class = require("./lib/class") -- include library because in lua don't have oop (class)

Player = Class {}              -- define Player is Class

-- all variable in that below
-- function Player:init() -- call default when create new this object
--   self.x = 10
--   self.y = 20
-- end

function Player:init(x, y) -- init with value
  self.x = x
  self.y = y
end

function Player:newPosition() -- define method
  self.x = self.x + 1         -- don't use x = x + 1
  self.y = self.y + 1
end

function Player:movePosition(x, y)
  self.x = x
  self.y = y
end

function Player:print()
  print("(" .. self.x .. ", " .. self.y .. ')')
end

function Player:distance(x, y)
  return math.sqrt((self.x - x) ^ 2 + (self.y - y) ^ 2)
end

local player = Player(15, 20)
player:print()                -- (15, 20)
player:newPosition()
player:print()                -- (16, 21)
player:movePosition(50, 55)
player:print()                -- (50, 55)
print(player:distance(10, 5)) -- 64.031242374328


print(player.x) -- can get x



-------------------------- inheritance in lua----------------------------------
Player1 = Class {}                                 -- new class
Player1 = common.class("Player1", Player1, Player) --  inheritance Player

function Player1:init()                            -- initial
  self.x = 15
  self.y = 20
end

function Player1:print() -- re-define print
  print("Player (" .. self.x .. ", " .. self.y .. ')')
end

local player1 = Player1()
player1:print()
player1:newPosition()
player1:print()
