function startGame()
    if gameState == "start" then
        gameState = "play"
    elseif gameState == "play" or gameState == "pause" then
        gameState = "start"
        resetBall()
    end
end

function pauseGame()
    if gameState == "play" then
        gameState = "pause"
    elseif gameState == "pause" then
        gameState = "play"
    end  
end

function resetBall()
    ballX = VIRTUAL_WIDTH / 2 - 2.5
    ballY = VIRTUAL_HEIGHT / 2 - 2.5
    ballDX = math.random(2) == 1 and -100 or 100
    ballDY = math.random(-50, 50)
end