function LoadPlayer()
  Player = {}
  Player.x = WIDTH / 2
  Player.y = HEIGHT / 2
  Player.radius = 20
  Player.speed = 100
end

function DrawPlayer()
  local angle = math.atan2((love.mouse.getY() - Player.y), (love.mouse.getX() - Player.x))

  love.graphics.translate(Player.x - 5 + 5, Player.y)
  love.graphics.rotate(angle - math.pi / 2)
  love.graphics.translate(-Player.x, -Player.y)

  love.graphics.setColor(1, 1, 0)
  love.graphics.rectangle("fill", Player.x - 7, Player.y, 14, 40)
  love.graphics.setColor(0, 1, 0)
  love.graphics.circle("fill", Player.x, Player.y, Player.radius)
  love.graphics.setColor(0, 0, 0)
  love.graphics.circle("fill", Player.x + 10, Player.y + 5, 4)
  love.graphics.circle("fill", Player.x - 10, Player.y + 5, 4)

  love.graphics.translate(Player.x, Player.y)
  love.graphics.rotate(-angle + math.pi / 2)
  love.graphics.translate(-Player.x, -Player.y)
end

function PlayerControl(dt)
  if love.keyboard.isDown("d") then
    Player.x = Player.x + Player.speed * dt
  elseif love.keyboard.isDown("a") then
    Player.x = Player.x - Player.speed * dt
  end

  if love.keyboard.isDown("w") then
    Player.y = Player.y - Player.speed * dt
  elseif love.keyboard.isDown("s") then
    Player.y = Player.y + Player.speed * dt
  end
end
