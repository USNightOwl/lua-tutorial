function love.load()
  Number = 0
end

function love.update(dt)
  Number = Number + 1
end

function love.draw()
  --love.graphics.print(tostring(Number))
  love.graphics.rectangle("fill", 50, 100, 100, 400)
end
