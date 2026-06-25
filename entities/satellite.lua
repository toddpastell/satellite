local D_SPEED = 0.2
local MAX_SPEED = 5
local MIN_SPEED = 2
local RADIAL_SPEED = 0.6

local SPEED = 3

satellite = sprite:extend({
  tags = { "all", "satellite" },
  body = { x = 1, y = 1, width = 5, height = 5 },
  state = "idle",
  idle = { interval = 4, 1, 2, 3, 4, 5, 6 },
  prev_target = nil,
  target = nil,
  speed = MIN_SPEED,
  rot = 1,
})

function satellite:update()
  sprite.update(self)

  local input = (btn(0) or btn(3)) and -1 or (btn(1) or btn(2)) and 1 or 0

  if self.target then
    local dx, dy = vec_sub(self.x, self.y, self.target.x, self.target.y)
    local nx, ny = vec_norm(dx, dy)
    local tx, ty = vec_perp(nx, ny)
    self.dx = self.rot * self.speed * tx
    self.dy = self.rot * self.speed * ty
    if input ~= 0 then
      self.speed = mid(self.speed + input * D_SPEED, MIN_SPEED, MAX_SPEED)
      self.dx = self.dx + nx * input * RADIAL_SPEED
      self.dy = self.dy + ny * input * RADIAL_SPEED
    end
  else
    tag.planet:each("collides", self, function(p)
      if p == self.prev_target then return end
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
