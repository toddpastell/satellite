sprite = entity:extend({
  frame = 1,
  state = "idle",
  idle = { interval = 8, 1 },
  tick = 0,
  step = 1,
})

function sprite:init()
  entity.init(self)
end

function sprite:update()
  self.tick = self.tick + 1
  local animation = self[self.state]
  if self.tick > animation.interval then
    self.tick = 0
    self.step = self.step + 1
    if self.step > #animation then
      self.step = 1
      if animation.next then
        return self:set_state(animation.next)
      end
    end
  end
  self.frame = animation[self.step]
end

function sprite:draw()
  spr(self.frame, self.x, self.y)
  -- self:draw_body()
end

function sprite:set_state(state)
  if self.state == state then
    return
  end
  self.state = state
  self.tick = 0
  self.step = 1
  self.frame = self[self.state][self.step]
end
