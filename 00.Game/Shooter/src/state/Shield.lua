function LoadShield()
  Shield = {}
  Shield.x = Player.x
  Shield.y = Player.y
  Shield.state = false
  Shield.startTime = 0
  Shield.img = love.graphics.newImage("/Graphics/items/shield.png")
  Shield.radius = Shield.img:getWidth() / 2
  Shield.endTime = 0
end

function DrawShield()
  if Shield.state then
    love.graphics.draw(Shield.img, Shield.x - Shield.radius, Shield.y - Shield.radius)
  end
end

local function chkCollisionShield()
  if #Enemies <= 0 then
    return
  end

  for i = #Enemies, 1, -1 do
    if IsCollision(Shield.x, Shield.y, Shield.radius, Enemies[i].x, Enemies[i].y, Enemies.radius) then
      Score = Score + 1
      RandcreateItem(Enemies[i].x, Enemies[i].y)
      table.remove(Enemies, i)
    end
  end
end

function UpdateShield()
  if Shield.state == false then
    return
  end
  Shield.x = Player.x
  Shield.y = Player.y
  if love.timer.getTime() >= Shield.endTime then
    Shield.state = false
  end

  chkCollisionShield()
end
