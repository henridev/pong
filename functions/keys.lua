function startGame()
    if gameState == "start" then
        gameState = "play"
    elseif gameState == "play" or gameState == "pause" then
        gameState = "start"
        ball:reset()
    end
end

function pauseGame()
    if gameState == "play" then
        gameState = "pause"
    elseif gameState == "pause" then
        gameState = "play"
    end  
end
