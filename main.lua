push = require 'push'
Class = require 'class'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

bg_x = 0
bg_y = 0
bg2_x = VIRTUAL_WIDTH
bg2_y = 0
LOOPINGPOINT = 512

bg = love.graphics.newImage("background.png")
bg2 = love.graphics.newImage("background.png")

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest")
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT, {fullscreen = false})

end

function love.update(dt)
    bg_x = bg_x - 1 * 20 * dt
    bg2_x = bg2_x - 1 * 20 * dt
    if bg_x < -VIRTUAL_WIDTH then
        bg_x = 0
    end
    if bg2_x < 0 then
        bg2_x = VIRTUAL_WIDTH
    end



end

function love.draw()
push:apply("start")
love.graphics.draw(bg,bg_x,bg_y)
love.graphics.draw(bg2,bg2_x,bg2_y)
love.graphics.print(tostring(bg_x), VIRTUAL_WIDTH / 2 - 50,VIRTUAL_HEIGHT / 3)
love.graphics.print(tostring(bg2_x), VIRTUAL_WIDTH / 2 - 50,VIRTUAL_HEIGHT / 3 + 50)
push:apply("end")
end

