require("./const")
require("/Background")
require('./Player')
require('./Enemy')
require('./Bullet')

local function loadGame()
  LoadBackground()
  LoadPlayer()
  LoadBullets()
  LoadEnemy()
  Score = 0
  Game = true
end

function love.load()
  loadGame()
end

function love.update(dt)
  if Game then
    UpdateBackground()
    PlayerControl(dt)
    UpdateBullet(dt)
    UpdateEnemies(dt)
  end

  if TouchPlayer() then
    Game = false
    SoundBG:stop()
  end
end

function love.draw()
  local x, y, R, G, B, font = 0, 0, 1, 1, 1, 30
  if Game then
    DrawBackround()
    DrawBullets()
    DrawPlayer()
    DrawEnemy()
  else
    local gameFont = love.graphics.newFont(80)
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setFont(gameFont)
    love.graphics.setColor(1, 0, 0)
    love.graphics.print("YOU LOSE", WIDTH / 2 - 200, HEIGHT / 5 - 50)
    love.graphics.setColor(1, 1, 1)
    gameFont = love.graphics.newFont(28)
    love.graphics.setFont(gameFont)
    love.graphics.print("Press r to play again", WIDTH / 2 - 130, HEIGHT - 250)
    x, y = WIDTH / 2 - 100, HEIGHT / 5 + 120
    R, G, B = 0, 0, 1
    font = 50
  end

  local gameFont = love.graphics.newFont(font)
  love.graphics.setColor(R, G, B)
  love.graphics.setFont(gameFont)
  love.graphics.print("SCORE:\n    " .. tostring(Score), x, y)
end

function love.mousepressed(x, y, button, istouch)
  if Game then
    CreateBullet(x, y, button)
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end
  if key == "space" and Game then
    CreateBullet(love.mouse.getX(), love.mouse.getY())
  end
  if key == "r" and Game == false then
    loadGame()
  end
end
