
function startGame()
    if gameState == GAME_STATES.start or gameState == GAME_STATES.serve then
        gameState = GAME_STATES.play
    elseif gameState == GAME_STATES.play or gameState == GAME_STATES.pause or gameState == GAME_STATES.gameOver then
        gameState = GAME_STATES.start
        ball:reset('random')
        resetScore()
    end
end

function pauseGame()
    if gameState == GAME_STATES.play then
        gameState = GAME_STATES.pause
    elseif gameState == GAME_STATES.pause then
        gameState = GAME_STATES.play
    end  
end


function resetScore()
    playerOneScore = 0
    playerTwoScore = 0
end 