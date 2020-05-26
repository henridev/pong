WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

X_PAD_ONE = 5
x_PAD_TWO = VIRTUAL_WIDTH - 10

push = require 'push'
require 'physics'
require 'draw'
require 'keys'


function love.load()
    math.randomseed(os.time())

    gameState = "start"

    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('assets/retro.TTF', 8) -- create font object 
    largeFont = love.graphics.newFont('assets/mario.TTF', 32) -- create font object 

    playerOneScore = 0
    playerTwoScore = 0

    padOneY = VIRTUAL_HEIGHT / 2 - 2.5
    padTwoY = VIRTUAL_HEIGHT / 2 - 2.5

    ballX = VIRTUAL_WIDTH / 2 - 2.5
    ballY = VIRTUAL_HEIGHT / 2 - 2.5

    ballDX = math.random(2) == 1 and -100 or 100
    ballDY = math.random(-50, 50)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.update(dt)
    if love.keyboard.isDown("s") then
        renderPad('playerOne', 'down', dt)
    elseif love.keyboard.isDown("z") then 
        renderPad('playerOne', 'up', dt)
    end
    if love.keyboard.isDown("down") then
        renderPad('playerTwo', 'down', dt)
    elseif love.keyboard.isDown("up") then 
        renderPad('playerTwo', 'up', dt)
    end
    if gameState == 'play' then
        renderBall(dt)
    end
end


function love.draw()
    push:apply('start')
    drawBoard()
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