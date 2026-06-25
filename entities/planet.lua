planet = entity:extend({
  tags = { "all", "planet" },
  radius = 5,
  color = 2,
})

function planet:did_init()
  local length = self.radius * 2
  self.body = { x = -self.radius, y = -self.radius, width = length, height = length }
end

function planet:draw()
  circfill(self.x + 1, self.y + 1, self.radius + 0.5, 5)
  circfill(self.x, self.y, self.radius, self.color)

  -- self:draw_body()
end
