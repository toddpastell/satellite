star = sprite:extend({
  tags = { "all", "bg" },
  state = "idle",
  frame = 12,
  idle = { interval = 30, 12, 12, 13, },
  glow = { interval = 30, 12, 12, 13, 14, 13 }
})

function star:did_init()
  self.tick = rnd(30)
  if rnd() > 0.8 then
    self:set_state("glow")
  end
end
