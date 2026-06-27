planet = entity:extend({
  tags = { "all", "planet" },
  radius = 5,
  color = 2,
  text = "",
})

function planet:did_init()
  local length = self.radius * 2 + 10
  self.body = { x = -self.radius - 5, y = -self.radius - 5, width = length, height = length }
  self.color = rnd({ 2, 3, 4, 8, 9, 13, 14, 15 })
end

function planet:draw()
  circfill(self.x + 1, self.y + 1, self.radius + 0.5, 1)
  circfill(self.x, self.y, self.radius, self.color)
  print(self.text, self.x - 3, self.y - 2, 7)

  -- self:draw_body()
end
