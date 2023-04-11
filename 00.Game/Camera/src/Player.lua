function LoadPlayer()
  Player = {}
  Player.img = love.graphics.newImage("/image/player.png")
  Player.width = Player.img:getWidth()
  Player.height = Player.img:getHeight()
  Player.x = WIDTH / 2
  Player.y = HEIGHT - Player.height
  Player.speed = 100
end

function PlayerControl(dt)
  local speed = Player.speed
  if love.keyboard.isDown("d") then
    Player.x = math.min(WIDTH - Player.width / 2, Player.x + speed * dt)
  elseif love.keyboard.isDown("a") then
    Player.x = math.max(Player.width / 2, Player.x - speed * dt)
  end

  if love.keyboard.isDown("w") then
    if Camera.y <= 0 then
      Camera.y = 0
      Player.y = math.max(Player.height / 2, Player.y - speed * dt)
      return
    end
    if Player.y <= HEIGHT / 2 then
      Player.y = HEIGHT / 2
      Camera.y = Camera.y - speed * dt
    end
    Player.y = math.max(Player.height / 2, Player.y - speed * dt)
  elseif love.keyboard.isDown("s") then
    if Camera.y >= WIDTH_WORLD - HEIGHT then
      Camera.y = WIDTH_WORLD - HEIGHT
      Player.y = math.min(HEIGHT - Player.height / 2, Player.y + speed * dt)
      return
    end
    if Player.y >= HEIGHT / 2 then
      Player.y = HEIGHT / 2
      Camera.y = Camera.y + speed * dt
    end
    Player.y = math.min(HEIGHT - Player.height / 2, Player.y + speed * dt)
  end
end

function DrawPlayer()
  love.graphics.draw(Player.img, Player.x - Player.width / 2, Player.y - Player.height / 2)
end
