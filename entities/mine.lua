mine = sprite:extend({
  tags = { "all", "mine" },
  body = { x = 1, y = 1, width = 4, height = 4 },
  state = "idle",
  idle = { interval = 6, 9, 10 },
})
