function love.load()
  Number = 0
  love.window.setMode(1000, 720)
end

function love.update(dt)
  Number = Number + 1
end

function love.draw()
  love.graphics.rectangle("line", 50, 100, 100, 400)
  love.graphics.rectangle("fill", 100, 100, 100, 400)
  love.graphics.rectangle("fill", 100, 100, 100, 400)
end
