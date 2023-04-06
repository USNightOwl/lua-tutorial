TimeStart = love.timer.getTime()

function LoadEnemy()
  Enemies = {}
  Enemies.speed = 40
  Enemies.radius = 20
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
  local pointY = math.random(0, HEIGHT)
  local pointX = 0
  if math.random(0, 100) % 2 == 0 then
    pointX = WIDTH
  end
  table.insert(Enemies,
    {
      x = pointX,
      y = pointY,
      cR = math.random(100, 255),
      cG = math.random(100, 255),
      cB = math.random(100, 255),
      life = MAX_LIFE
    })
end

function DrawEnemy()
  if #Enemies <= 0 then
    return
  end

  for i = 1, #Enemies do
    local x, y = Enemies[i].x, Enemies[i].y
    love.graphics.setColor(Enemies[i].cR / 255, Enemies[i].cG / 255, Enemies[i].cB / 255,
      1 / (MAX_LIFE - Enemies[i].life + 1))
    love.graphics.circle("fill", x, y, Enemies.radius)
  end
end

function UpdateEnemies(dt)
  CreateEnemy()

  if #Enemies <= 0 then
    return
  end

  for i = 1, #Enemies do
    local x, y = Enemies[i].x, Enemies[i].y
    local angle = math.atan2((Player.y - y), (Player.x - x))
    local enemyDx = Enemies.speed * math.cos(angle)
    local enemyDy = Enemies.speed * math.sin(angle)
    Enemies[i].x = Enemies[i].x + enemyDx * dt * ((Score + 50) / 50)
    Enemies[i].y = Enemies[i].y + enemyDy * dt * ((Score + 50) / 50)
  end
end

function TouchPlayer()
  if #Enemies <= 0 then
    return false
  end

  for i = 1, #Enemies do
    if IsCollision(Enemies[i].x, Enemies[i].y, Enemies.radius, Player.x, Player.y, Player.radius) then
      return true
    end
  end

  return false
end
