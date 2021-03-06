--region CONSTANTS
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

X_PAD_ONE = 5
x_PAD_TWO = VIRTUAL_WIDTH - 10

BRED = 40 / 255
BGREEN = 45 / 255
BBLUE = 100 / 255

GAME_STATES = {setup = "setup", start = "start", play = "play" , pause = "pause", serve = "serve", gameOver = "gameOver"}
--endregion

--region IMPORTS
push = require 'utils/push'
Class = require 'utils/class'

require "classes/Ball"
require "classes/Paddle"
require "classes/PaddleV2"
require "classes/AI"

require 'functions/draw'
require 'functions/keys'
--endregion

function love.load()
    --region OTHER SETUP
        love.graphics.setDefaultFilter('nearest', 'nearest')
        push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
            fullscreen = false,
            vsync = true,
            resizable = true
        })
        math.randomseed(os.time())
    --endregion

    --region GAME STATE
        gameState = GAME_STATES.start
        difficulty = "hard"
        -- total game score
        playerOneScore = 0
        playerTwoScore = 0

        -- who scored last
        scored = nil
    --endregion

    --region FONTS
        smallFont = love.graphics.newFont('assets/fonts/font.TTF', 8) 
        largeFont = love.graphics.newFont('assets/fonts/font.TTF', 32) 
        love.graphics.setFont(smallFont)
    --endregion

    --region AUDIO
    sounds = {
        ["paddle_hit"] = love.audio.newSource('assets/audio/ping.mp3', 'stream'),
        ["wall_hit"] = love.audio.newSource('assets/audio/wall.wav', 'static'),
        ["victory"] = love.audio.newSource('assets/audio/victory.wav', 'static')
    }
    --endregion

    --region CLASSES
    playerOne = AI(X_PAD_ONE, VIRTUAL_HEIGHT / 2 - 2.5, 5, 20, 200)
    playerTwo = Paddle(x_PAD_TWO, VIRTUAL_HEIGHT / 2 - 2.5, 5, 20, 200)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2.5, VIRTUAL_HEIGHT / 2 - 2.5, 5, 5)
    --endregion
    
end

-- update state on each frame 
-- dt = time since last update in # seconds 
function love.update(dt)
    --region PLAYER ONE MOVE
    -- if love.keyboard.isDown("s") then
    --     playerOne:update('down', dt)
    -- elseif love.keyboard.isDown("z") then 
    --     playerOne:update('up', dt)
    -- end
    playerOne:update(ball, dt, difficulty)
    --endregion

    --region PLAYER TWO MOVE 
    if love.keyboard.isDown("down") then
        playerTwo:update('down', dt)
    elseif love.keyboard.isDown("up") then 
        playerTwo:update('up', dt)
    end
    --endregion

    --region BALL MOVEMENT and COLLISSION
    if gameState == GAME_STATES.play then
        -- Ball movement
        ball:update(dt)
        -- Ball X paddle collission check
        if ball:collides(playerOne) then
            -- gradualy increase ball speed
            ball.dx = ball.dx - 5 
            ball.dx = -ball.dx
        elseif ball:collides(playerTwo) then
            -- gradually increase ball speed 
            ball.dx = ball.dx + 5 
            ball.dx = -ball.dx
        else
            if ball:playerOneMiss() then 
                playerOneMissUpdate()
            elseif ball:playerTwoMiss() then 
                playerTwoMissUpdate()
            end
        end 
        -- Ball X wall collission check
        ball:contain()         
    end
    --endregion
end

-- function to draw on screen each frame
function love.draw()
    push:apply('start')
    -- clear full screen 
    love.graphics.clear(BRED, BGREEN, BBLUE, 0.8)
    drawText()
    drawFPS()

    -- draw left padd 
    playerOne:render()
    -- draw right padd 
    playerTwo:render() 
    -- draw the ball 
    ball:render()
    push:apply('end')
end

-- callback executed on every key press 
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "enter" or key == "return" then
        startGame()
    elseif key == "space" then 
        pauseGame() 
    end
end

function love.resize(w, h)
    push: resize(w, h)
 end

--region MISS-handlers ;)
function playerOneMissUpdate() 
    playerTwoScore = playerTwoScore + 1
    scored = "playerTwo"
    if playerTwoScore >= 10 then 
        gameState = GAME_STATES.gameOver
        sounds['victory']:play()
        ball:reset('random')
    else 
        gameState = GAME_STATES.serve
        ball:reset('playerTwo')
    end
end

function playerTwoMissUpdate()
    playerOneScore = playerOneScore + 1
    scored = "playerOne"
    if playerOneScore >= 10 then 
        gameState = GAME_STATES.gameOver
        sounds['victory']:play()
        ball:reset('random')
    else 
        gameState = GAME_STATES.serve
        ball:reset('playerOne')
    end        
end
--endregion