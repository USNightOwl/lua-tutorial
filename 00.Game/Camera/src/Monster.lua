local timer = love.timer.getTime()
local moc = 3

local allImg = {
  {
    img = love.graphics.newImage("/image/monster1.png"),
    width = love.graphics.newImage("/image/monster1.png"):getWidth(),
    height = love.graphics.newImage("/image/monster1.png"):getHeight(),
  },
  {
    img = love.graphics.newImage("/image/monster2.png"),
    width = love.graphics.newImage("/image/monster2.png"):getWidth(),
    height = love.graphics.newImage("/image/monster2.png"):getHeight(),
  }
}

function LoadMonster()
  Monsters = {}
  Monsters.speed = 50
end

function CreateMonster()
  local direction = -1
  local x = WIDTH_WORLD
  if love.math.random(0, 101) % 2 == 0 then
    x = 0
    direction = -1
  end
  local imgNum = love.math.random(1, 2)
  table.insert(Monsters, {
    x = x,
    y = love.math.random(0 + allImg[imgNum].height / 2, HEIGHT_WORLD - allImg[imgNum].height / 2),
    img = allImg[imgNum].img,
    width = allImg[imgNum].width,
    height = allImg[imgNum].height,
    direction = direction
  })
end

function DrawMonsters()
  if #Monsters <= 0 then
    return
  end
  for i = #Monsters, 1, -1 do
    local monster = Monsters[i]
    love.graphics.draw(monster.img, monster.x - Camera.x - monster.width / 2, monster.y - Camera.y - monster.height / 2)
  end
end

function UpdateMonsters(dt)
  if love.timer.getTime() - timer >= moc then
    moc = moc + 2
    timer = love.timer.getTime()
    CreateMonster()
  end
  if #Monsters <= 0 then
    return
  end
  for i = #Monsters, 1, -1 do
    local monster = Monsters[i]
    monster.x = monster.x + monster.direction * Monsters.speed * dt
    if monster.x <= monster.width / 2 then
      monster.x = monster.width / 2
      monster.direction = monster.direction * -1
    end
    if monster.x >= WIDTH_WORLD - monster.width / 2 then
      monster.x = WIDTH_WORLD - monster.width / 2
      monster.direction = monster.direction * -1
    end
  end
  TouchPlayer()
end

function TouchPlayer()
  if #Monsters <= 0 then
    return
  end
  for i = #Monsters, 1, -1 do
    local monster = Monsters[i]
    if IsCollision(monster.x - Camera.x, monster.y - Camera.y, monster.width, monster.height, Player.x, Player.y, Player.width, Player.height) then
      Game = false
    end
  end
end
