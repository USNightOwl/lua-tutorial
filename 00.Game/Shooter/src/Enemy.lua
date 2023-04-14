local allEnemies =
{
  {
    enemy_img = {
      [1] = love.graphics.newImage("/Graphics/enemy/enemy1.png"),
      [2] = love.graphics.newImage("/Graphics/enemy/enemy1.png")
    },
    life = 3,
    speed = 40
  },
  {
    enemy_img = {
      [1] = love.graphics.newImage("/Graphics/enemy/enemy2.png"),
      [2] = love.graphics.newImage("/Graphics/enemy/enemy2.png")
    },
    life = 1,
    speed = 80
  },
  {
    enemy_img = {
      [1] = love.graphics.newImage("/Graphics/enemy/enemy3_1.png"),
      [2] = love.graphics.newImage("/Graphics/enemy/enemy3_2.png"),
      [3] = love.graphics.newImage("/Graphics/enemy/enemy3_hit1.png"),
      [4] = love.graphics.newImage("/Graphics/enemy/enemy3_hit2.png")
    },
    life = love.math.random(8, 10),
    speed = 30
  }
}

local soundCollision = love.audio.newSource("/Sounds/player_hit.wav", "static")

TimeStart = love.timer.getTime()

function LoadEnemy()
  Enemies = {}
  Enemies.speed = 40
end

function CreateEnemy()
  local time = love.timer.getTime()
  if #Enemies >= 10 then
    TimeStart = time
    return
  end
  if time - TimeStart <= 4 - Score / 30 then
    return
  end
  TimeStart = time
  local pointY = love.math.random(0, HEIGHT)
  local pointX = 0
  if love.math.random(0, 100) % 2 == 0 then
    pointX = WIDTH
  end
  local state = love.math.random(1, 100) % #allEnemies + 1
  table.insert(Enemies,
    {
      img = allEnemies[state].enemy_img,
      x = pointX,
      y = pointY,
      cR = math.random(100, 255),
      cG = math.random(100, 255),
      cB = math.random(100, 255),
      life = allEnemies[state].life,
      max_life = allEnemies[state].life,
      state = state,
      shape = 1,
      speed = allEnemies[state].speed,
      time = love.timer.getTime()
    })
end

function DrawEnemy()
  if #Enemies <= 0 then
    return
  end

  for i = 1, #Enemies do
    local width, height = Enemies[i].img[Enemies[i].shape]:getDimensions()
    local x, y = Enemies[i].x, Enemies[i].y
    love.graphics.setColor(Enemies[i].cR / 255, Enemies[i].cG / 255, Enemies[i].cB / 255,
      1 / (Enemies[i].max_life - Enemies[i].life + 1))
    love.graphics.draw(Enemies[i].img[Enemies[i].shape], x, y, 0, 1, 1, width / 2, height / 2)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", x - 12, y - width / 2 - 6,
      24 - 24 / Enemies[i].max_life * (Enemies[i].max_life - Enemies[i].life), 5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", x - 12, y - width / 2 - 6, 24, 5)
    --love.graphics.circle("fill", x, y, Enemies.radius)
  end
end

function UpdateEnemies(dt)
  if love.timer.getTime() - Runtime >= 10 then
    Stop = false
  end

  if Stop then
    return
  end

  CreateEnemy()

  if #Enemies <= 0 then
    return
  end

  for i = 1, #Enemies do
    local x, y = Enemies[i].x, Enemies[i].y
    local angle = math.atan2((Player.y - y), (Player.x - x))
    local enemyDx = Enemies[i].speed * math.cos(angle)
    local enemyDy = Enemies[i].speed * math.sin(angle)
    Enemies[i].x = Enemies[i].x + enemyDx * dt * ((Score + 50) / 50)
    Enemies[i].y = Enemies[i].y + enemyDy * dt * ((Score + 50) / 50)
    if love.timer.getTime() - Enemies[i].time > 1 then
      Enemies[i].time = love.timer.getTime()
      Enemies[i].shape = Enemies[i].shape % (#Enemies[i].img / 2) + 1
    end
  end
end

function TouchPlayer()
  if #Enemies <= 0 then
    return false
  end

  for i = 1, #Enemies do
    if IsCollision(Enemies[i].x, Enemies[i].y, Enemies[i].img[Enemies[i].shape]:getWidth() / 2, Player.x, Player.y, Player.radius) then
      if Game == true then
        soundCollision:play()
        table.remove(Enemies, i)
      end
      return true
    end
  end

  return false
end

function ClearAllEnemies()
  for i = #Enemies, 1, -1 do
    table.remove(Enemies, i)
    Score = Score + 1
  end
end
