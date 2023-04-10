function LoadTimer()
  Timer = {}
  Timer.x = 130
  Timer.y = 10
  Timer.width = 700
  Timer.height = 10
  Timer.size = 1
end

function DrawTimer()
  if Shield.state then
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", Timer.x, Timer.y, Timer.size * Timer.width, Timer.height)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", Timer.x, Timer.y, Timer.width, Timer.height)
  end
end

function UpdateTimer()
  if Shield.state == false then
    return
  end
  Timer.size = 1 - (love.timer.getTime() - Shield.startTime) / (Shield.endTime - Shield.startTime)
end
