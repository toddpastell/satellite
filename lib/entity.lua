entity = class:extend({
  tags = { "all" },
  x = 0,
  y = 0,
  dx = 0,
  dy = 0,
  body = { x = 0, y = 0, width = 1, height = 1 },
  touching = 0,
})

function entity:init()
  for _, t in ipairs(self.tags) do
    assert(tag[t], "unknown tag: " .. t)
    tag[t]:add(self)
  end
end

function entity:destroy()
  for _, t in ipairs(self.tags) do
    tag[t]:remove(self)
  end
end

function entity:update() end

function entity:draw() end

function entity:overlaps(other)
  return self.x + self.body.x < other.x + other.body.x + other.body.width
      and self.x + self.body.x + self.body.width > other.x + other.body.x
      and self.y + self.body.y < other.y + other.body.y + other.body.height
      and self.y + self.body.y + self.body.height > other.y + other.body.y
end

function entity:collides(other, fn)
  if self:overlaps(other) then
    fn(self, other)
  end
end

function entity:draw_body()
  rect(self.x + self.body.x,
    self.y + self.body.y,
    self.x + self.body.x + self.body.width,
    self.y + self.body.y + self.body.height,
    8)
end

function entity:push_x(other)
  if self:overlaps(other) then
    local isRight = other.dx > 0
    other.x = self.x + self.body.x - other.body.x + (isRight and -other.body.width or self.body.width)
    other.dx = 0
    other.touching = bit.bor(other.touching, isRight and 1 or 2)
  end
end

function entity:push_y(other)
  if self:overlaps(other) then
    local isDown = other.dy > 0
    other.y = self.y + self.body.y - other.body.y + (isDown and -other.body.height or self.body.height)
    other.dy = 0
    other.touching = bit.bor(self.touching, isDown and 4 or 8)
  end
end
