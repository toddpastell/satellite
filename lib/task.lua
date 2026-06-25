task = class:extend({
  pool = {},
})

function task:update()
  for job, _ in pairs(self.pool) do
    job.time = job.time - 1
    if job.time <= 0 then
      job.fn()
      if job.period then
        job.time = job.period
      else
        self.pool[job] = nil
      end
    end
  end
end

function task:after(delay, fn)
  local job = { time = delay, fn = fn }
  self.pool[job] = true
  return job
end

function task:every(period, fn)
  local job = { time = period, period = period, fn = fn }
  self.pool[job] = true
  return job
end

function task:cancel(job)
  self.pool[job] = nil
end

function task:clear()
  self.pool = {}
end
