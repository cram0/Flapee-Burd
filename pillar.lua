Pillar = Class{}

local PILLAR_IMAGE = love.graphics.newImage("pillar.png")
local PILLAR_SPEED = -100

function Pillar:init()
    self.x = VIRTUAL_WIDTH
    self.y = math.random(VIRTUAL_HEIGHT / 4, VIRTUAL_HEIGHT - 10)
    self.width = PILLAR_IMAGE:getWidth()
end

function Pillar:update(dt)
    self.x = self.x + PILLAR_SPEED * dt
end

function Pillar:render()
    love.graphics.draw(PILLAR_IMAGE,self.x,self.y)
end
