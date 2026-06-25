game = scene:extend()

-- local c = { x = 0, y = 0 }

function game:init()
  local p = planet({ x = 32, y = 64, radius = 12 })
  self.p1 = satellite({ x = 64, y = 64, target = p })
  planet({ x = 64, y = 24, radius = 15 })
  planet({ x = 96, y = 96, radius = 8 })
  mine({ x = 72, y = 72 })
  mine({ x = 80, y = 72 })
  mine({ x = 88, y = 72 })
end

function game:update()
  tag.all:each("update")
  tag.mine:each("collides", self.p1, function(m)
    if self.p1.dead then return end
    self.p1.dead = true
    for i = 1, 4 do
      fire({ x = self.p1.x + rnd(8) - 4, y = self.p1.y + rnd(8) - 4 })
    end
    self.p1:destroy()
    task:after(30, function() scene:load(title) end)
  end)

  -- c.x = self.p1.x - 64
  -- c.y = self.p1.y - 64
  -- camera(c.x, c.y)
end
