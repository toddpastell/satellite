function lerp(a, b, t)
  local d = b - a
  if d < 1 and d > -1 then return b end
  return a + d * t
end

function vec_sub(x1, y1, x2, y2)
  return x1 - x2, y1 - y2
end

function vec_len(dx, dy)
  return sqrt(dx * dx + dy * dy)
end

function vec_norm(dx, dy)
  local len = vec_len(dx, dy)
  return dx / len, dy / len
end

function vec_cross(dx1, dy1, dx2, dy2)
  return dx1 * dy2 - dy1 * dx2
end

function vec_perp(dx, dy)
  return -dy, dx
end
