push = require "push"
Class = require "class"
require "pillar"
require "stan"

math.randomseed(os.time())
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

local packPillars = {}



local stan = Stan()
bg = love.graphics.newImage("gfx/background.png")
bg2 = love.graphics.newImage("gfx/background.png")
fg = love.graphics.newImage("gfx/foreground.png")
fg2 = love.graphics.newImage("gfx/foreground.png")



function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {fullscreen = false})
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

    function love.keypressed(key)
        if key == "escape" then
            love.event.quit()
        end
        if key == "space" then
            stan.dy = -150
        end
    end
    pillar:update(dt)
    stan:update(dt)
end

function love.draw()
    push:apply("start")
    love.graphics.draw(bg, bg_x, bg_y)
    love.graphics.draw(bg2, bg2_x, bg2_y)
    stan:render()
    pillar:render()
    love.graphics.draw(fg, fg_x, VIRTUAL_HEIGHT - 10)
    love.graphics.draw(fg2, fg2_x, VIRTUAL_HEIGHT - 10)
    love.graphics.print(tostring(stan.y), 0, 10)
    love.graphics.print(tostring(stan.dy), 0, 20)
    love.graphics.print(tostring(love.timer.getFPS()), 0, 30)
    push:apply("end")
end
