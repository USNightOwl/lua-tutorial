require("./const")

function love.load()
  LoadPlayer()
  LoadBullets()
end

function love.update(dt)
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end

  PlayerControl(dt)
  UpdateBullet(dt)
end

function love.draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.circle("fill", Player.x, Player.y, 20)
  DrawBullets()
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

function love.mousepressed(x, y, button, istouch)
  CreateBullet(x, y, button)
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
end

function DrawBullets()
  for i = 1, #Bullets do
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", Bullets[i].x, Bullets[i].y, 5)
    love.graphics.setColor(1, 1, 1)
  end
end
