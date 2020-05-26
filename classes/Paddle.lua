Paddle = Class{}
local VIRTUAL_HEIGHT = 243

function Paddle:init(x, y, width , height, speed)
    self.x = x 
    self.y = y
    self.width = width 
    self.height = height
    self.dy = speed
end

function Paddle:update(direction, dt)
    if direction == 'down' then
        self.y = math.min(VIRTUAL_HEIGHT - 20, self.y + (self.dy * dt))
    elseif direction == 'up' then 
        self.y = math.max(0, self.y - (self.dy * dt))
    end
end

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
