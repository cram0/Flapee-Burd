push = require "push"
Class = require "class"
require "pillar"
require "stan"
require "strict"

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

local pillar1 = Pillar(VIRTUAL_WIDTH + (VIRTUAL_WIDTH / 4) )
local pillar2 = Pillar(VIRTUAL_WIDTH + (VIRTUAL_WIDTH / 4) * 2)
local pillar3 = Pillar(VIRTUAL_WIDTH + (VIRTUAL_WIDTH / 4) * 3)
local pillar4 = Pillar(VIRTUAL_WIDTH + (VIRTUAL_WIDTH / 4) * 4)

local packPillars = {pillar1,pillar2,pillar3,pillar4}





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

    function movePillar(_pillar,dt)
        _pillar.x = _pillar.x - 60 * dt
    end

    for k, v in pairs(packPillars) do
        if v.x <= -v.width then
            v.x = VIRTUAL_WIDTH
        else
            movePillar(v,dt)
        end
    end

    

    stan:update(dt)
end

function love.draw()
    push:apply("start")
    love.graphics.draw(bg, bg_x, bg_y)
    love.graphics.draw(bg2, bg2_x, bg2_y)
    stan:render()
    pillar1:render()
    pillar2:render()
    pillar3:render()
    pillar4:render()
    love.graphics.draw(fg, fg_x, VIRTUAL_HEIGHT - 10)
    love.graphics.draw(fg2, fg2_x, VIRTUAL_HEIGHT - 10)
    love.graphics.print("y : "..tostring(stan.y), 0, 10)
    love.graphics.print("dy : "..tostring(stan.dy), 0, 20)
    love.graphics.print(tostring(love.timer.getFPS()), 0, 30)
    love.graphics.print("Pilier 1 : "..tostring(pillar1.x), VIRTUAL_WIDTH - 100, 10)
    love.graphics.print("Pilier 2 : "..tostring(pillar2.x), VIRTUAL_WIDTH - 100, 20)
    love.graphics.print("Pilier 3 : "..tostring(pillar3.x), VIRTUAL_WIDTH - 100, 30)
    love.graphics.print("Pilier 4 : "..tostring(pillar4.x), VIRTUAL_WIDTH - 100, 40)

    push:apply("end")
end
