Game = true
WIDTH = 900
HEIGHT = 600
WIDTH_WORLD, HEIGHT_WORLD = love.graphics.newImage("/image/bg.png"):getDimensions()

function IsCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  x1, y1 = x1 - w1 / 2, y1 - h1 / 2
  x2, y2 = x2 - w2 / 2, y2 - h2 / 2
  return ((x1 + w1 >= x2) and (x2 + w2 >= x1) and (y1 + h1 >= y2) and (y2 + h2 >= y1))
end

require("src.Player")
require("src.Camera")
require("src.Monster")

function love.load()
  LoadPlayer()
  LoadCamera()
  LoadMonster()
end

function love.update(dt)
  if Game then
    PlayerControl(dt)
    UpdateMonsters(dt)
  end
end

function love.draw()
  DrawCamera()
  DrawPlayer()
  DrawMonsters()
end

function love.mousepressed(x, y, button, istouch, presses)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" or scancode == 'return' then
    love.event.quit()
  end
end
