require '../utils/debuger'

AI = Class{}
local VIRTUAL_HEIGHT = 243

function AI:init(x, y, width , height, speed, level)
    self.x = x 
    self.y = y
    self.width = width 
    self.height = height
    self.dy = speed
    self.level = level
    self.pixelPerFrame = 0
end

function AI:update(ball, dt)
    
    -- if ball.y > self.y then
    --     tmp = self.dy * dt
    --     love.graphics.print("moves:" ..tostring(tmp), 100, 100)
    --     self.y = math.min(VIRTUAL_HEIGHT - 20, self.y + (self.dy * dt))
    -- elseif ball.y < self.y then 
    --     self.y = math.max(0, self.y - (self.dy * dt))
    -- end
    self.pixelPerFrame = self.dy * dt
    if self.level == "impossible" then 
        self.y = ball.y
    end
    return self.dy * dt
end


function AI:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function AI:debug()
    love.graphics.print("moves at pixels per frame: " ..tostring(self.pixelPerFrame), 200, 200)
end


