local allState =
{
  {
    bullet_img = love.graphics.newImage("/Graphics/bullet/bullet1.png")
  },
  {
    bullet_img = love.graphics.newImage("/Graphics/bullet/bullet2.png")
  },
  {
    bullet_img = love.graphics.newImage("/Graphics/bullet/bullet3.png")
  }
}

local soundCollision = love.audio.newSource("/Sounds/enemy_hit.wav", "static")
local soundFire = love.audio.newSource("/Sounds/player_fire.wav", "static")
soundFire:setVolume(0.5)

function LoadBullets()
  Bullets = {}
  Bullets.speed = 250
  Bullets.max = 5
  Bullets.img = allState[State].bullet_img
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
  if State == 1 or State == 3 then
    Bullets.max = 5
    if State == 3 then
      Bullets.max = 3
    end
    table.insert(Bullets,
      { img = allState[State].bullet_img, x = startX, y = startY, dx = bulletDx, dy = bulletDy, angle = angle })
  elseif State == 2 then
    Bullets.max = 15
    if #Bullets <= 12 then
      table.insert(Bullets,
        {
          img = allState[State].bullet_img,
          x = startX,
          y = startY,
          dx = Bullets.speed * math.cos(angle - math.pi / 15),
          dy = Bullets.speed * math.sin(angle - math.pi / 15),
          angle = angle - math.pi / 15
        })
      table.insert(Bullets,
        {
          img = allState[State].bullet_img,
          x = startX,
          y = startY,
          dx = Bullets.speed * math.cos(angle + math.pi / 15),
          dy = Bullets.speed * math.sin(angle + math.pi / 15),
          angle = angle + math.pi / 15
        })
      table.insert(Bullets,
        { img = allState[State].bullet_img, x = startX, y = startY, dx = bulletDx, dy = bulletDy, angle = angle })
    end
  end
end

function DrawBullets()
  local width, height = allState[State].bullet_img:getDimensions()
  Bullets.radius = width / 2

  for i = 1, #Bullets do
    --love.graphics.setColor(1, 0, 0)
    --love.graphics.circle("fill", Bullets[i].x, Bullets[i].y, Bullets.radius)
    local angle = Bullets[i].angle
    local x, y = Bullets[i].x, Bullets[i].y

    love.graphics.translate(x, y)
    love.graphics.rotate(angle + math.pi / 2)
    love.graphics.translate(-x, -y)

    love.graphics.draw(Bullets[i].img, Bullets[i].x, Bullets[i].y, 0, 1, 1, width / 2, height / 2)

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
    elseif love.math.random(5, 401) % 5 == 0 and Stop == false then
      CreateItem(x, y, 5) -- stop time
    elseif love.math.random(5, 401) % 8 == 0 then
      CreateItem(x, y, 6) -- clear all Enemies
    elseif love.math.random(5, 401) % 4 == 0 and State ~= 2 then
      CreateItem(x, y, 7) -- mutil shot
    elseif love.math.random(5, 401) % 12 == 0 then
      CreateItem(x, y, 3) -- shield
    elseif love.math.random(5, 401) % 4 == 0 and State ~= 3 then
      CreateItem(x, y, 8) -- one shot one kill
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
      if IsCollision(Bullets[i].x, Bullets[i].y, Bullets.radius, Enemies[j].x, Enemies[j].y, Enemies[j].img[Enemies[j].shape]:getWidth() / 2) then
        table.remove(Bullets, i)
        Enemies[j].shape = love.math.random(#Enemies[j].img / 2 + 1, #Enemies[j].img)
        Enemies[j].life = Enemies[j].life - 1
        soundCollision:play()
        if Enemies[j].life <= 0 or State == 3 then
          RandcreateItem(Enemies[j].x, Enemies[j].y)
          table.remove(Enemies, j)
          Score = Score + 1
        end
        break
      end
    end
  end
end
