smoke = sprite:extend({
  tags = { "all", "fg" },
  state = "emit",
  emit = { interval = 2, next = "idle", 22, 23, 24, 25, 24, 25 },
  idle = { interval = 8, 0 }
})

function smoke:update()
  sprite.update(self)

  self.x = self.x + self.dx
  self.y = self.y + self.dy

  if self.state == "idle" then
    self:destroy()
  end
end
