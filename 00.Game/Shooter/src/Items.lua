local typeItems = {
  {
    img = love.graphics.newImage('/Graphics/items/wing.png'),
    scale = { 1, 1.4 },
    timeLife = 8,
  },
  {
    img = love.graphics.newImage('/Graphics/items/golden.png'),
    scale = { 1, 1.2 },
    timeLife = 10,
  },
  {
    img = love.graphics.newImage('/Graphics/items/shield.png'),
    scale = { 0.3, 0.4 },
    timeLife = 15,
  },
  {
    img = love.graphics.newImage('/Graphics/items/speed.png'),
    scale = { 0.8, 1 },
    timeLife = 10,
  },
  {
    img = love.graphics.newImage('/Graphics/items/clock.png'),
    scale = { 0.8, 1 },
    timeLife = 10,
  },
  {
    img = love.graphics.newImage('/Graphics/items/bomb.png'),
    scale = { 0.8, 1 },
    timeLife = 8,
  }
}

function LoadItems()
  Items = {}
end

function CreateItem(tx, ty, type)
  table.insert(Items,
    {
      x = tx,
      y = ty,
      type = type,
      tt = 1,
      timeStart = love.timer.getTime(),
      timeChange = love.timer.getTime(),
      radius = typeItems[type].img:getWidth() / 2
    })
end

function DrawItems()
  if #Items <= 0 then
    return
  end

  for i = 1, #Items do
    local tmp = typeItems[Items[i].type]
    local item = Items[i]
    local radius = item.radius * tmp.scale[item.tt]
    love.graphics.draw(tmp.img, item.x - radius, item.y - radius, 0, tmp.scale[item.tt], tmp.scale
      [item.tt])
  end
end

local function chkCollisionPlayer()
  for i = #Items, 1, -1 do
    local item = Items[i]
    local tmp = typeItems[Items[i].type]
    local radius = item.radius * tmp.scale[item.tt]
    if IsCollision(item.x, item.y, radius, Player.x, Player.y, Player.radius) then
      if item.type == 1 and Player.life < 3 then
        Player.life = Player.life + 1
      elseif item.type == 2 then
        Score = Score + 2
      elseif item.type == 3 then
        if Shield.state == true then
          Shield.endTime = Shield.endTime + 10
        else
          Shield.state = true
          Shield.startTime = love.timer.getTime()
          Shield.endTime = Shield.startTime + 10
        end
      elseif item.type == 4 then
        Player.bonus = Player.bonus + 20
        Player.bonusTime = love.timer.getTime()
      elseif item.type == 5 then
        Stop = true
        Runtime = love.timer.getTime()
      elseif item.type == 6 then
        ClearAllEnemies()
      end
      table.remove(Items, i)
    end
  end
end

function UpdateItems(dt)
  if #Items <= 0 then
    return
  end

  for i = #Items, 1, -1 do
    local curr = love.timer.getTime()
    local tmp = typeItems[Items[i].type]
    if curr - Items[i].timeChange >= 0.5 then
      Items[i].timeChange = curr
      Items[i].tt = Items[i].tt % 2 + 1
    end
    if curr - Items[i].timeStart >= tmp.timeLife then
      table.remove(Items, i)
    end
  end

  chkCollisionPlayer()
end
