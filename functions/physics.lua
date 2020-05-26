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
