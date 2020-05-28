function drawText(playerScored)
    love.graphics.setFont(smallFont)
    if gameState == "start" then
        love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Press enter to start playing', 0, 35, VIRTUAL_WIDTH, 'center')
    elseif gameState == "play" then
        love.graphics.printf('let\'s ping!', 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == "pause" then
        love.graphics.printf('paused', 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == "serve" then
        if playerScored == 'playerTwo' then 
            love.graphics.printf('Player two scored player one serves', 0, 20, VIRTUAL_WIDTH, 'center')
        elseif playerScored == 'playerOne' then 
            love.graphics.printf('Player one scored player two serves', 0, 20, VIRTUAL_WIDTH, 'center')
        end
    end
    love.graphics.setFont(largeFont)
    love.graphics.print(playerOneScore, VIRTUAL_WIDTH / 2 - 50 , VIRTUAL_HEIGHT / 3)
    love.graphics.print(playerTwoScore, VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)
end

function drawFPS()
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.setFont(smallFont)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 40, 20)
    love.graphics.setColor(1, 1, 1, 1)
end

