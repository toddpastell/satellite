title = scene:extend()

local l2, l3

function title:init()
  label({ center_x = true, y = 24, text = "⁶w⁶t⁶oc40satellite" })
  l2 = label({ center_x = true, y = 62, text = "speed: " .. SPEED })
  label({ x = 19, y = 62, text = "⬇️", color = 14 })
  label({ x = 100, y = 62, text = "⬆️", color = 12 })
  l3 = label({ center_x = true, y = 74, text = "level: " .. LEVEL })
  label({ x = 19, y = 74, text = "⬅️", color = 14 })
  label({ x = 100, y = 74, text = "➡️", color = 12 })
  label({ center_x = true, y = 100, text = "start" })
  label({ x = 100, y = 100, text = "🅾️", color = 8 })
  music(0)
end

function title:update()
  scene.update(self)

  local is = btnp(3) and -1 or btnp(2) and 1 or 0
  if is ~= 0 then
    SPEED = mid(SPEED + is, 1, 10)
    l2.text = "speed: " .. SPEED
    sfx(is == 1 and 19 or 20)
  end

  local il = btnp(0) and -1 or btnp(1) and 1 or 0
  if il ~= 0 then
    LEVEL = mid(LEVEL + il, 1, #LEVELS)
    l3.text = "level: " .. LEVEL
    sfx(il == 1 and 19 or 20)
  end

  if btnp(4) then
    sfx(18)
    scene:load(game)
  end
end
