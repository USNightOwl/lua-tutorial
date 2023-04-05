function LoadBullets()
  Bullets = {}
  Bullets.speed = 250
  Bullets.radius = 5
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

  table.insert(Bullets, { x = startX, y = startY, dx = bulletDx, dy = bulletDy })
end

function DrawBullets()
  for i = 1, #Bullets do
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", Bullets[i].x, Bullets[i].y, Bullets.radius)
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
        if Enemies[j].life <= 0 then
          table.remove(Enemies, j)
          Score = Score + 1
        end
        break
      end
    end
  end
end
