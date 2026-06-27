scene = class:extend({ current = nil })

function scene:update()
  tag.all:each("update")
end

function scene:draw()
  cls()
  tag.all:each("draw")
end

function scene:destroy()
  tag.all:each("destroy")
  task:clear()
  camera()
  music(-1)
end

function scene:load(next)
  if self.current == next then return end
  if (self.current) then self.current:destroy() end
  self.current = next()
end
