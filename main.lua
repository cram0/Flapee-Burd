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
fg_x = 0
fg2_x = 0
LOOPINGPOINT = 512

bg = love.graphics.newImage("background.png")
bg2 = love.graphics.newImage("background.png")
fg = love.graphics.newImage("foreground.png")
fg2 = love.graphics.newImage("foreground.png")
stan = love.graphics.newImage("stan.png")

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest")
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT, {fullscreen = false})

end

function love.update(dt)

    ----Scrolls background----
    bg_x = bg_x - 1 * 20 * dt
    bg2_x = bg2_x - 1 * 20 * dt
    if bg_x < -VIRTUAL_WIDTH then
        bg_x = 0
    end
    if bg2_x < 0 then
        bg2_x = VIRTUAL_WIDTH
    end
    --------------------------

    ----Scrolls foreground----
    fg_x = fg_x - 1 * 30 * dt
    fg2_x = fg2_x - 1 * 30 * dt
    if fg_x < -VIRTUAL_WIDTH then
        fg_x = 0
    end
    if fg2_x < 0 then
        fg2_x = VIRTUAL_WIDTH
    end
    --------------------------


end

function love.draw()
push:apply("start")
love.graphics.draw(bg,bg_x,bg_y)
love.graphics.draw(bg2,bg2_x,bg2_y)
love.graphics.draw(stan, VIRTUAL_WIDTH / 2 , VIRTUAL_HEIGHT / 2 , 0, 0.1,0.1)
love.graphics.draw(fg,fg_x,VIRTUAL_HEIGHT-10)
love.graphics.draw(fg2,fg2_x,VIRTUAL_HEIGHT-10)
love.graphics.print(tostring(bg_x), 0 , 10)
love.graphics.print(tostring(bg2_x), 0 , 20)
push:apply("end")
end

