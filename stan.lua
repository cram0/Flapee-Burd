Stan = Class{}

local STAN_IMAGE = love.graphics.newImage("gfx/stan.png")
local GRAVITY = 1

function Stan:init()
    self.x = VIRTUAL_WIDTH / 2 - 25
    self.y = VIRTUAL_HEIGHT / 2 - 24
    self.dy = 0
    self.width = STAN_IMAGE:getWidth()
    self.height = STAN_IMAGE:getHeight()
end

function Stan:reset()
    self.y = VIRTUAL_HEIGHT / 2 - 24
    self.dy = 0
end

function Stan:update(dt)
    self.dy = self.dy + GRAVITY
    self.y = self.y + self.dy * dt
    if self.y + (50 * 0.90) >= VIRTUAL_HEIGHT then
        Stan:reset()
    end
end

function Stan:render()
    love.graphics.draw(STAN_IMAGE, self.x, self.y, 0, 0.9,0.9)
end
