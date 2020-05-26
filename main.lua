WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

X_PAD_ONE = 5
x_PAD_TWO = VIRTUAL_WIDTH - 10

push = require 'utils/push'
Class = require 'utils/class'

require "classes/Ball"
require "classes/Paddle"

require 'functions/draw'
require 'functions/keys'


function love.load()
    math.randomseed(os.time())

    gameState = "start"

    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('assets/retro.TTF', 8) -- create font object 
    largeFont = love.graphics.newFont('assets/mario.TTF', 32) -- create font object 

    playerOneScore = 0
    playerTwoScore = 0

    paddleOne = Paddle(X_PAD_ONE, VIRTUAL_HEIGHT / 2 - 2.5, 5, 20, 200)
    paddleTwo = Paddle(x_PAD_TWO, VIRTUAL_HEIGHT / 2 - 2.5, 5, 20, 200)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2.5, VIRTUAL_WIDTH / 2 - 2.5, 5, 5)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.update(dt)
    if love.keyboard.isDown("s") then
        paddleOne:update('down', dt)
    elseif love.keyboard.isDown("z") then 
        paddleOne:update('up', dt)
    end
    if love.keyboard.isDown("down") then
        paddleTwo:update('down', dt)
    elseif love.keyboard.isDown("up") then 
        paddleTwo:update('up', dt)
    end
    if gameState == 'play' then
        ball:update(dt)
    end
end


function love.draw()
    push:apply('start')
    love.graphics.clear(bred, bgreen, bblue, 0.8)
    -- draw the ball 
    ball:render()
    -- draw left padd 
    paddleOne:render()
    -- draw right padd 
    paddleTwo:render()
    drawText()
    push:apply('end')
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "enter" or key == "return" then
        startGame()
    elseif key == "space" then 
        pauseGame() 
    end
end