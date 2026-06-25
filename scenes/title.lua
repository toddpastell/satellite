title = scene:extend()

function title:init()
  local l = label({ center_x = true, center_y = true, text = "satellite" })
  local j = task:every(1, function()
    l.y = lerp(l.y, 12, 0.5)
  end)
  task:after(30, function()
    task:cancel(j)
    l:destroy()
  end)

  label({ center_x = true, y = 72, text = "press 🅾️ (z)" })
end

function title:update()
  scene.update(self)

  if btnp(4) then
    scene:load(game)
  end
end
