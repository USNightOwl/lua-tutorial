function love.load()
  Number = 0

  Target = {}
  Target.x = 450
  Target.y = 200
  Target.radius = 50

  Score = 0
  Timer = 0

  gameFont = love.graphics.newFont(40)
  Key = "None"
  Scancode = "None"

  love.window.setTitle("Hello Love")
  love.graphics.setBackgroundColor(0, 0, 1)
end

function love.update(dt)
  Number = Number + 1
end

function love.draw()
  --love.graphics.print(tostring(Number))
  --color must divide to 255 (if you get basic RGB code)
  love.graphics.setColor(255 / 255, 0, 0)
  love.graphics.rectangle("fill", 50, 100, 100, 400)
  love.graphics.setColor(204 / 255, 102 / 255, 255 / 255)
  love.graphics.circle("line", 200, 300, 100)

  love.graphics.setColor(0, 1, 0)
  love.graphics.circle("fill", Target.x, Target.y, Target.radius)

  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(gameFont)
  love.graphics.print(tostring(Score), 30, 30)

  love.graphics.print("key: " .. Key, love.graphics.getWidth() - 30 * 20, 0)
  love.graphics.print("scancode: " .. Scancode, love.graphics.getWidth() - 30 * 20, 50)
end

function love.mousepressed(x, y, button, istouch, presses)
  local distance = DistanceBetween(x, y, Target.x, Target.y)
  if distance > Target.radius then
    return
  end
  if button == 1 then
    Score = Score + 1
  elseif button == 2 then
    Score = Score - 1
  end
  Target.x = math.random(50, love.graphics.getWidth() - 50)
  Target.y = math.random(50, love.graphics.getHeight() - 50)
end

function DistanceBetween(x1, y1, x2, y2)
  return math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" or scancode == 'return' then
    love.event.quit()
  end
  Key = key
  Scancode = scancode
end
