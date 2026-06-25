fire = sprite:extend({
  tags = { "all" },
  state = "burn",
  burn = { interval = 2, next = "idle", 16, 17, 18, 19, 20, 19, 20 },
  idle = { interval = 8, 0 }
})

function fire:update()
  sprite.update(self)

  if self.state == "idle" then
    self:destroy()
  end
end
