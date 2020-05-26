local bred = 40 / 255
local bgreen = 45 / 255
local bblue = 52 / 255

function drawText()
    love.graphics.setFont(smallFont)
    if gameState == "start" then
        love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == "play" then
        love.graphics.printf('let us play!', 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == "pause" then
        love.graphics.printf('paused', 0, 20, VIRTUAL_WIDTH, 'center')
    end
    love.graphics.setFont(largeFont)
    love.graphics.print(playerOneScore, VIRTUAL_WIDTH / 2 - 50 , VIRTUAL_HEIGHT / 3)
    love.graphics.print(playerTwoScore, VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)
end

function drawBoard()
    
    -- draw the ball 
    love.graphics.rectangle('fill', ballX , ballY , 5, 5)
    -- draw left padd 
    PaddleOne:render()
    -- draw right padd 
    PaddleTwo:render()
end