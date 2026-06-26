RADIAL_SPEED = 1
SPEED = 3

satellite = sprite:extend({
  tags = { "all", "satellite" },
  body = { x = 1, y = 1, width = 5, height = 5 },
  state = "idle",
  idle = { interval = 4, 1, 2, 3, 4, 5, 6 },
  prev_target = nil,
  target = nil,
  rot = 1,
})

function satellite:update()
  sprite.update(self)

  local input = btn(3) and -1 or btn(2) and 1 or 0

  if self.target then
    local dx, dy = vec_sub(self.x, self.y, self.target.x, self.target.y)
    local nx, ny = vec_norm(dx, dy)
    local tx, ty = vec_perp(nx, ny)
    self.dx = self.rot * SPEED * tx
    self.dy = self.rot * SPEED * ty
    if input ~= 0 then
      self.dx = self.dx + nx * input * RADIAL_SPEED
      self.dy = self.dy + ny * input * RADIAL_SPEED
      smoke({ x = self.x, y = self.y, dx = -nx * input * RADIAL_SPEED, dy = -ny * input * RADIAL_SPEED })
    end
  else
    tag.planet:each("collides", self, function(p)
      if p == self.prev_target then return end
      if p.text == "" then p.text = "★" end
      self.target = p
      local dx, dy = vec_sub(self.x, self.y, self.target.x, self.target.y)
      self.rot = sgn(vec_cross(dx, dy, self.dx, self.dy))
    end)
  end

  if btnp(4) then
    self.prev_target = self.target
    self.target = nil
  end

  self.x = self.x + self.dx
  self.y = self.y + self.dy
end
