function startGame()
    if gameState == "start" or gameState == "serve" then
        gameState = "play"
    elseif gameState == "play" or gameState == "pause" or gameState == "end" then
        gameState = "start"
        ball:reset('random')
        resetScore()
    end
end

function pauseGame()
    if gameState == "play" then
        gameState = "pause"
    elseif gameState == "pause" then
        gameState = "play"
    end  
end


function resetScore()
    playerOneScore = 0
    playerTwoScore = 0
end 