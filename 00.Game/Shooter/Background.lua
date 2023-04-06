local dir = "Graphics/background"
local files = love.filesystem.getDirectoryItems(dir)
---- Sounds

local function upDateImage()
  BG.change = false
  BG.current = BG.current % #BG + 1
  BG.img = love.graphics.newImage(BG[BG.current])
  BG.width, BG.height = BG.img:getDimensions()
end

function LoadBackground()
  SoundBG = love.audio.newSource("Sounds/background.mp3", "stream")
  SoundBG:setLooping(true)
  SoundBG:play()
  BG = {}
  BG.current = 0
  for _, file in ipairs(files) do
    table.insert(BG, dir .. '/' .. file)
  end
  upDateImage()
end

function DrawBackround()
  local sx, sy = WIDTH / BG.width, HEIGHT / BG.height
  love.graphics.draw(BG.img, 0, 0, 0, sx, sy)
end

function UpdateBackground()
  if Score > 0 and Score % ChangeBG ~= 0 then
    BG.change = true
  end
  if Score % ChangeBG == 0 and BG.change == true then
    BG.change = false
    upDateImage()
  end
end
