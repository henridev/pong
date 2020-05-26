local bred = 20 / 255
local bgreen = 20 / 255
local bblue = 230 / 255
local paddleSpeed = 200

local VIRTUAL_HEIGHT = 243

function renderPad(player, direction, dt)
    love.graphics.clear(bred, bgreen, bblue, 0.8)

    if player == 'playerOne' then
        

        love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)
        love.graphics.setColor(1, 1, 1, 1)

        if direction == 'down' then
            padOneY = padOneY + (paddleSpeed * dt)
            love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)

        elseif direction == 'up' then 
            padOneY = padOneY - (paddleSpeed * dt)
            love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)
        end

    elseif player == 'playerTwo' then

        love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)
        love.graphics.setColor(1, 1, 1, 1)

        if direction == 'down' and padTwoY < VIRTUAL_HEIGHT then
            padTwoY = padTwoY + (paddleSpeed * dt)
            love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)

        elseif direction == 'up' and padTwoY > 0  then 
            padTwoY = padTwoY - (paddleSpeed * dt)
            love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)
        end

    end

end