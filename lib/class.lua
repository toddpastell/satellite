class = {}
class.__index = class

function class:init() end

function class:did_init() end

function class:new(tbl)
  tbl = tbl or {}
  setmetatable(tbl, self)
  tbl:init()
  tbl:did_init()
  return tbl
end

function class:extend(tbl)
  tbl = tbl or {}
  tbl.__index = tbl
  return setmetatable(tbl, {
    __index = self,
    __call = function(c, ...)
      return c:new(...)
    end
  })
end
