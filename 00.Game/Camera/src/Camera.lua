function LoadCamera()
  Camera = {}
  Camera.img = love.graphics.newImage("/image/bg.png")
  Camera.x = 0
  Camera.y = HEIGHT_WORLD - HEIGHT
end

function NewPosition(direction, speed)

end

function DrawCamera()
  love.graphics.draw(Camera.img, 0, 0, 0, 1, 1, Camera.x, Camera.y)
end
