WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

X_PAD_ONE = 5
x_PAD_TWO = VIRTUAL_WIDTH - 10

local bred = 20 / 255
local bgreen = 20 / 255
local bblue = 230 / 255


push = require 'push'


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('assets/retro.TTF', 8) -- create font object 
    largeFont = love.graphics.newFont('assets/mario.TTF', 32) -- create font object 

    playerOneScore = 0
    playerTwoScore = 0

    padOneY = VIRTUAL_HEIGHT / 2 - 2.5
    padTwoY = VIRTUAL_HEIGHT / 2 - 2.5

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.update()
    if love.keyboard.isDown("s") then
        renderPad('playerOne', 'down')
    elseif love.keyboard.isDown("z") then 
        renderPad('playerOne', 'up')
    elseif love.keyboard.isDown("down") then
        renderPad('playerTwo', 'down')
    elseif love.keyboard.isDown("up") then 
        renderPad('playerTwo', 'up')
    end
end


function love.draw()
    push:apply('start')
    drawBoard()
    drawText()
    push:apply('end')
end

-- exit game 
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end



function drawText()
    love.graphics.setFont(smallFont)
    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(largeFont)
    love.graphics.print(playerOneScore, VIRTUAL_WIDTH / 2 - 50 , VIRTUAL_HEIGHT / 3)
    love.graphics.print(playerTwoScore, VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)
end

function drawBoard()
    love.graphics.clear(bred, bgreen, bblue, 0.8)
    -- draw the ball 
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2.5, VIRTUAL_HEIGHT / 2 - 2.5, 5, 5)
    -- draw left padd 
    love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)
    -- draw right padd 
    love.graphics.rectangle('fill', x_PAD_TWO, padTwoY , 5, 20)
end

function renderPad(player, direction)
    love.graphics.clear(bred, bgreen, bblue, 0.8)
    if player == 'playerOne' then
        love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)
        love.graphics.setColor(1, 1, 1, 1)
        if direction == 'down' then
            padOneY = padOneY + 1
            love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)
        elseif direction == 'up' then 
            padOneY = padOneY - 1
            love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)
        end
    elseif player == 'playerTwo' then
        love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)
        love.graphics.setColor(1, 1, 1, 1)
        if direction == 'down' then
            padTwoY = padTwoY + 1
            love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)
        elseif direction == 'up' then 
            padTwoY = padTwoY - 1
            love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)
        end
    end
end