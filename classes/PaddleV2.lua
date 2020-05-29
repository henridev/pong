PaddleV2 = Class{}
local ACCELERATION = 20

function PaddleV2:init(x, y, width , height, speed)
    self.x = x 
    self.y = y
    self.width = width 
    self.height = height
    self.dy = speed
end

function PaddleV2:update(direction, dt)
    if direction == 'down' then
        self.dy = self.dy - ACCELERATION*dt
        self.y = math.min(VIRTUAL_HEIGHT - 20, self.y + (self.dy * dt))
    elseif direction == 'up' then 
        self.dy = self.dy + ACCELERATION*dt
        self.y = math.max(0, self.y - (self.dy * dt))
    end
end

function PaddleV2:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
