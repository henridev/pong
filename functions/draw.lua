function drawText()
    love.graphics.setFont(smallFont)
    if gameState == "start" then
        love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Press enter to start playing', 0, 35, VIRTUAL_WIDTH, 'center')
    elseif gameState == "play" then
        love.graphics.printf('let\'s ping!', 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == "pause" then
        love.graphics.printf('paused', 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == "serve" then
        if scored == 'playerTwo' then 
            love.graphics.printf('Player two scored', 0, 20, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('press enter to serve player one', 0, 35, VIRTUAL_WIDTH, 'center')
        else
            love.graphics.printf('Player one scored', 0, 20, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('press enter to serve player two', 0, 35, VIRTUAL_WIDTH, 'center')
        end
    elseif gameState == "end" then
        if scored == 'playerTwo' then 
            love.graphics.printf('Player two won congratulations!', 0, 20, VIRTUAL_WIDTH, 'center')
        else
            love.graphics.printf('Player one won congratulations!', 0, 20, VIRTUAL_WIDTH, 'center')
        end
        love.graphics.printf('press enter to restart!', 0, 35, VIRTUAL_WIDTH, 'center')
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

