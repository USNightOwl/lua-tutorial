local bullet_img = love.graphics.newImage("/Graphics/bullet.png")
local width, height = bullet_img:getDimensions()
local soundCollision = love.audio.newSource("/Sounds/enemy_hit.wav", "static")
local soundFire = love.audio.newSource("/Sounds/player_fire.wav", "static")
soundFire:setVolume(0.5)

function LoadBullets()
  Bullets = {}
  Bullets.speed = 250
  Bullets.radius = width / 2
  Bullets.max = 5
end

function CreateBullet(x, y, button)
  if #Bullets >= Bullets.max then
    return
  end

  local startX = Player.x
  local startY = Player.y
  local mouseX = x
  local mouseY = y

  local angle = math.atan2((mouseY - startY), (mouseX - startX))
  local bulletDx = Bullets.speed * math.cos(angle)
  local bulletDy = Bullets.speed * math.sin(angle)

  soundFire:play()
  table.insert(Bullets, { x = startX, y = startY, dx = bulletDx, dy = bulletDy, angle = angle })
end

function DrawBullets()
  for i = 1, #Bullets do
    --love.graphics.setColor(1, 0, 0)
    --love.graphics.circle("fill", Bullets[i].x, Bullets[i].y, Bullets.radius)
    local angle = Bullets[i].angle
    local x, y = Bullets[i].x, Bullets[i].y

    love.graphics.translate(x, y)
    love.graphics.rotate(angle + math.pi / 2)
    love.graphics.translate(-x, -y)

    love.graphics.draw(bullet_img, Bullets[i].x, Bullets[i].y, 0, 1, 1, width / 2, height / 2)

    love.graphics.translate(x, y)
    love.graphics.rotate(-angle - math.pi / 2)
    love.graphics.translate(-x, -y)
  end
end

function UpdateBullet(dt)
  if #Bullets <= 0 then
    return
  end

  for i = #Bullets, 1, -1 do
    Bullets[i].x = Bullets[i].x + Bullets[i].dx * dt
    Bullets[i].y = Bullets[i].y + Bullets[i].dy * dt

    if Bullets[i].x <= 0 or Bullets[i].x >= WIDTH or Bullets[i].y <= 0 or Bullets[i].y >= HEIGHT then
      table.remove(Bullets, i)
    end
  end

  ChkCollision()
end

function RandcreateItem(x, y)
  if love.math.random(6, 399) % 2 == 0 then
    if love.math.random(5, 401) % 3 == 0 and Player.life < 3 then
      CreateItem(x, y, 1) -- mang
    elseif love.math.random(4, 442) % 4 == 0 then
      CreateItem(x, y, 4) -- speed
    elseif love.math.random(5, 401) % 4 == 0 then
      CreateItem(x, y, 3) -- shield
    elseif love.math.random(5, 401) % 5 == 0 and Stop == false then
      CreateItem(x, y, 5) -- stop time
    elseif love.math.random(5, 401) % 8 == 0 then
      CreateItem(x, y, 6) -- clear all Enemies
    else
      CreateItem(x, y, 2) -- coin
    end
  end
end

function ChkCollision()
  if #Enemies <= 0 or #Bullets <= 0 then
    return
  end

  for i = #Bullets, 1, -1 do
    for j = #Enemies, 1, -1 do
      if IsCollision(Bullets[i].x, Bullets[i].y, Bullets.radius, Enemies[j].x, Enemies[j].y, Enemies.radius) then
        table.remove(Bullets, i)
        Enemies[j].life = Enemies[j].life - 1
        soundCollision:play()
        if Enemies[j].life <= 0 then
          RandcreateItem(Enemies[j].x, Enemies[j].y)
          table.remove(Enemies, j)
          Score = Score + 1
        end
        break
      end
    end
  end
end
