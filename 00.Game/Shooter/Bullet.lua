local bullet_img = love.graphics.newImage("/Graphics/bullet.png")
local width, height = bullet_img:getDimensions()
local soundCollision = love.audio.newSource("/Sounds/enemy_hit.wav", "static")
local soundFire = love.audio.newSource("/Sounds/player_fire.wav", "static")
soundFire:setVolume(0.5)

function LoadBullets()
  Bullets = {}
  Bullets.speed = 250
  Bullets.radius = width / 2
end

function CreateBullet(x, y, button)
  if #Bullets >= 5 then
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
          table.remove(Enemies, j)
          Score = Score + 1
        end
        break
      end
    end
  end
end
