local wing = love.graphics.newImage("/Graphics/wing.png")

local player_img = love.graphics.newImage('Graphics/player.png')

local width, height = player_img:getDimensions()

function LoadPlayer()
  Player = {}
  Player.life = 3
  Player.x = WIDTH / 2
  Player.y = HEIGHT / 2
  Player.radius = width / 2
  Player.speed = 100
end

function DrawPlayer()
  local angle = math.atan2((love.mouse.getY() - Player.y), (love.mouse.getX() - Player.x))

  love.graphics.translate(Player.x, Player.y)
  love.graphics.rotate(angle + math.pi / 2)
  love.graphics.translate(-Player.x, -Player.y)

  --[[
    love.graphics.setColor(1, 1, 0)
    love.graphics.rectangle("fill", Player.x - 7, Player.y, 14, 40)
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", Player.x, Player.y, Player.radius)
    love.graphics.setColor(0, 0, 0)
    love.graphics.circle("fill", Player.x + 10, Player.y + 5, 4)
    love.graphics.circle("fill", Player.x - 10, Player.y + 5, 4)
  ]]
  love.graphics.draw(player_img, Player.x, Player.y, 0, 1, 1, width / 2, height / 2)

  love.graphics.translate(Player.x, Player.y)
  love.graphics.rotate(-angle - math.pi / 2)
  love.graphics.translate(-Player.x, -Player.y)

  for i = 1, Player.life do
    love.graphics.draw(wing, WIDTH - 170 + 40 * (Player.life - i + 1), 10, 0, 0.05, 0.05)
  end
end

function PlayerControl(dt)
  dt = dt * ((Score + 50) / 50)
  if love.keyboard.isDown("d") then
    Player.x = math.min(WIDTH - Player.radius / 2, Player.x + Player.speed * dt)
  elseif love.keyboard.isDown("a") then
    Player.x = math.max(Player.radius / 2, Player.x - Player.speed * dt)
  end

  if love.keyboard.isDown("w") then
    Player.y = math.max(Player.radius / 2, Player.y - Player.speed * dt)
  elseif love.keyboard.isDown("s") then
    Player.y = math.min(HEIGHT - Player.radius / 2, Player.y + Player.speed * dt)
  end
end
