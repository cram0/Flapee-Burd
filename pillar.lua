Pillar = Class{}

local PILLAR_IMAGE = love.graphics.newImage("gfx/pillar.png")
local PILLAR_SPEED = 30

function Pillar:init()
    self.x = VIRTUAL_WIDTH - 3
    self.y = VIRTUAL_HEIGHT / 2
    self.width = PILLAR_IMAGE:getWidth()
end

function Pillar:update(dt)
    self.x = self.x - PILLAR_SPEED * dt


end

function Pillar:render()
    love.graphics.draw(PILLAR_IMAGE,self.x,self.y)
end
