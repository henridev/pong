local paddleSpeed = 200
local VIRTUAL_HEIGHT = 243

function renderPad(player, direction, dt)
    if player == 'playerOne' then
        if direction == 'down' then
            padOneY = math.min(VIRTUAL_HEIGHT - 20, padOneY + (paddleSpeed * dt))
        elseif direction == 'up' then 
            padOneY = math.max(0, padOneY - (paddleSpeed * dt))
        end
    elseif player == 'playerTwo' then
        if direction == 'down'  then
            padTwoY = math.min(VIRTUAL_HEIGHT - 20, padTwoY + (paddleSpeed * dt))
        elseif direction == 'up' then 
            padTwoY = math.max(0, padTwoY - (paddleSpeed * dt))
        end
    end 
end

function renderBall(dt)
    ballX = ballX + (ballDX*dt)
    ballY = ballY + (ballDY*dt)
end

-- function renderPad(player, direction, dt)
--     love.graphics.clear(bred, bgreen, bblue, 0.8)

--     if player == 'playerOne' then

--         -- love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)
--         -- love.graphics.setColor(1, 1, 1, 1)

--         if direction == 'down' and padOneY < VIRTUAL_HEIGHT - 20 then
--             padOneY = padOneY + (paddleSpeed * dt)
--             -- love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)

--         elseif direction == 'up' and padOneY > 0 then 
--             padOneY = padOneY - (paddleSpeed * dt)
--             -- love.graphics.rectangle('fill', X_PAD_ONE, padOneY, 5, 20)
--         end

--     elseif player == 'playerTwo' then

--         -- love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)
--         -- love.graphics.setColor(1, 1, 1, 1)

--         if direction == 'down' and padTwoY < VIRTUAL_HEIGHT - 20 then
--             padTwoY = padTwoY + (paddleSpeed * dt)
--             -- love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)

--         elseif direction == 'up' and padTwoY > 0  then 
--             padTwoY = padTwoY - (paddleSpeed * dt)
--             -- love.graphics.rectangle('fill', x_PAD_TWO, padTwoY, 5, 20)
--         end

--     end
    
-- end
