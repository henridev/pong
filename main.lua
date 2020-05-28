--region CONSTANTS
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

X_PAD_ONE = 5
x_PAD_TWO = VIRTUAL_WIDTH - 10

local bred = 40 / 255
local bgreen = 45 / 255
local bblue = 100 / 255
--endregion

--region IMPORTS
push = require 'utils/push'
Class = require 'utils/class'

require "classes/Ball"
require "classes/Paddle"

require 'functions/draw'
require 'functions/keys'
--endregion

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

  --region GAME STATE
    -- can be start / play / pause / serve / end
    gameState = "start"

    -- totla game score
    playerOneScore = 0
    playerTwoScore = 0

    -- who scored last
    scored = nil
  --endregion

  --region FONTS
    love.window.setTitle('ping pong')
    smallFont = love.graphics.newFont('assets/font.TTF', 8) 
    largeFont = love.graphics.newFont('assets/font.TTF', 32) 
    love.graphics.setFont(smallFont)
  --endregion


    --region AUDIO
    sounds = {
        ["paddle_hit"] = love.audio.newSource('assets/audio/ping.mp3', 'stream'),
        ["wall_hit"] = love.audio.newSource('assets/audio/wall.mp3', 'stream'),
        ["victory"] = love.audio.newSource('assets/audio/victory.wav', 'static')
    }
    --endregion

    --region CLASSES
    playerOne = Paddle(X_PAD_ONE, VIRTUAL_HEIGHT / 2 - 2.5, 5, 20, 200)
    playerTwo = Paddle(x_PAD_TWO, VIRTUAL_HEIGHT / 2 - 2.5, 5, 20, 200)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2.5, VIRTUAL_HEIGHT / 2 - 2.5, 5, 5)
    --endregion

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.update(dt)
    if love.keyboard.isDown("s") then
        playerOne:update('down', dt)
    elseif love.keyboard.isDown("z") then 
        playerOne:update('up', dt)
    end
    if love.keyboard.isDown("down") then
        playerTwo:update('down', dt)
    elseif love.keyboard.isDown("up") then 
        playerTwo:update('up', dt)
    end
    if gameState == 'play' then
        ball:update(dt)

        if ball:collides(playerOne) then
            ball.dx = -ball.dx
        elseif ball:collides(playerTwo) then
            ball.dx = -ball.dx
        end 
    
        ball:contain() 
    
        if ball:playerOneMiss() then 
            playerTwoScore = playerTwoScore + 1
            scored = "playerTwo"
            if playerTwoScore >= 10 then 
                gameState = "end"
                sounds['victory']:play()
                ball:reset('random')
            else 
                gameState = "serve"
                ball:reset('playerTwo')
            end
        end
    
        if ball:playerTwoMiss() then 
            playerOneScore = playerOneScore + 1
            scored = "playerOne"
            if playerOneScore >= 10 then 
                gameState = "end"
                sounds['victory']:play()
                ball:reset('random')
            else 
                gameState = "serve"
                ball:reset('playerOne')
            end            
        end

        
    end
end


function love.draw()
    push:apply('start')
    love.graphics.clear(bred, bgreen, bblue, 0.8)
    -- draw the ball 
    ball:render()
    -- draw left padd 
    playerOne:render()
    -- draw right padd 
    playerTwo:render() 
    if gameState == "serve" or gameState == "end" then
        drawText(scored)
    else
        drawText()
    end
    drawFPS()
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