tag = class:extend()

function tag:init()
  self.pool = {}
end

function tag:add(entity)
  self.pool[entity] = true
end

function tag:remove(entity)
  self.pool[entity] = nil
end

function tag:each(method, ...)
  for entity in pairs(self.pool) do
    entity[method](entity, ...)
  end
end

function tag:walk(fn, ...)
  for entity, _ in pairs(self.pool) do
    fn(entity, ...)
  end
end

tag.all = tag()
tag.bg = tag()
tag.fg = tag()
tag.ui = tag()
tag.mine = tag()
tag.planet = tag()
tag.satellite = tag()
