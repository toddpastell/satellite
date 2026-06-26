title = scene:extend()

local l1, l2, l3

function title:init()
  l1 = label({ center_x = true, y = 24, text = "⁶w⁶t⁶oc40satellite" })
  l2 = label({ center_x = true, y = 62, text = "speed: " .. SPEED })
  label({ x = 19, y = 62, text = "⬇️" })
  label({ x = 100, y = 62, text = "⬆️" })
  l3 = label({ center_x = true, y = 74, text = "level: " .. LEVEL })
  label({ x = 19, y = 74, text = "⬅️" })
  label({ x = 100, y = 74, text = "➡️" })
  label({ center_x = true, y = 100, text = "start" })
  label({ x = 100, y = 100, text = "🅾️" })
  satellite({ x = 48, y = 8, target = l1 })
end

function title:update()
  scene.update(self)

  local is = btnp(3) and -1 or btnp(2) and 1 or 0
  if is ~= 0 then
    SPEED = mid(SPEED + is, 1, 10)
    l2.text = "speed: " .. SPEED
  end

  local il = btnp(0) and -1 or btnp(1) and 1 or 0
  if il ~= 0 then
    LEVEL = mid(LEVEL + il, 1, #LEVELS)
    l3.text = "level: " .. LEVEL
  end

  if btnp(4) then
    scene:load(game)
  end
end
