win = scene:extend()

function win:init()
  LEVEL = mid(LEVEL + 1, 1, #LEVELS)
  label({ center_x = true, y = 24, text = "⁶w⁶t⁶oc40mission" })
  label({ center_x = true, y = 44, text = "⁶w⁶t⁶oc40complete" })
  label({ center_x = true, y = 74, text = "next level" })
  label({ x = 100, y = 74, text = "🅾️", color = 8 })
  label({ center_x = true, y = 86, text = "to title" })
  label({ x = 100, y = 86, text = "❎", color = 14 })
end

function win:update()
  if btnp(4) then
    scene:load(game)
  end
  if btnp(5) then
    scene:load(title)
  end
end
