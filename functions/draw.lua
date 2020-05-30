function drawText()
    love.graphics.setFont(smallFont)

    if gameState == GAME_STATES.start then
        drawTopText('Hello Pong!')
        drawBottomText('Press enter to start playing')

    elseif gameState == GAME_STATES.play then
        drawTopText('let\'s ping!')
        drawBottomText('Press space to start pause')

    elseif gameState == GAME_STATES.pause then
        drawTopText('paused')
        drawBottomText('Press space to restart')

    elseif gameState == GAME_STATES.serve then
        if scored == 'playerTwo' then 
            drawTopText('Player two scored')
            drawBottomText('press enter to serve player one')
        else
            drawTopText('Player one scored')
            drawBottomText('press enter to serve player two')
        end
    
    elseif gameState == GAME_STATES.gameOver then
        if scored == 'playerTwo' then 
            drawTopText('Player two won congratulations!')
        else
            drawTopText('Player one won congratulations!')
        end
        drawBottomText('press enter to restart!')
    end
    scoreDraw()
end

function drawSetup()
    
end

function drawFPS()
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.setFont(smallFont)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 40, 20)
    love.graphics.setColor(1, 1, 1, 1)
end

function scoreDraw()
    love.graphics.setFont(largeFont)
    love.graphics.print(playerOneScore, VIRTUAL_WIDTH / 2 - 50 , VIRTUAL_HEIGHT / 3)
    love.graphics.print(playerTwoScore, VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)
end

function drawTopText(message)
    love.graphics.printf(message, 0, 20, VIRTUAL_WIDTH, 'center')
end

function drawBottomText(message)
    love.graphics.printf(message, 0, 35, VIRTUAL_WIDTH, 'center')
end