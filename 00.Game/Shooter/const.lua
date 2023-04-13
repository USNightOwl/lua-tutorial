HEIGHT = love.graphics.getHeight()
WIDTH = love.graphics.getWidth()
MAX_LIFE = 3
Game = true
Score = 0
ChangeBG = 10
SoundBG = love.audio.newSource("Sounds/background.mp3", "stream")
Stop = false
Runtime = 0
State = 1
StateTime = 0

function IsCollision(x1, y1, r1, x2, y2, r2)
  local distance = math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
  if distance <= r1 + r2 then
    return true
  end
  return false
end
