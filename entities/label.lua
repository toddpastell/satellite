label = entity:extend({
  text = "",
  color = 7,
})

function label:did_init()
  if self.center_x then
    self.x = 64 - (#self.text * 2)
  end
  if self.center_y then
    self.y = 62
  end
end

function label:draw()
  print(self.text, self.x, self.y, self.color)
end
