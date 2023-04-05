HEIGHT = love.graphics.getHeight()
WIDTH = love.graphics.getWidth()

function LoadPlayer()
  Player = {}
  Player.x = 100
  Player.y = 100
  Player.speed = 100
end

function LoadBullets()
  Bullets = {}
  Bullets.speed = 250
end

function CreateBullet(x, y, button)
  local startX = Player.x
  local startY = Player.y
  local mouseX = x
  local mouseY = y

  local angle = math.atan2((mouseY - startY), (mouseX - startX))
  local bulletDx = Bullets.speed * math.cos(angle)
  local bulletDy = Bullets.speed * math.sin(angle)

  table.insert(Bullets, { x = startX, y = startY, dx = bulletDx, dy = bulletDy })
end
