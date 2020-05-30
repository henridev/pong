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

function AI:update(ball, dt, difficulty)    
    if difficulty == "hard" then 
        self.dy = math.random(45,50)
    elseif difficulty == "medium" then
        self.dy = math.random(30,45)
    elseif difficulty == "easy" then
        self.dy = math.random(25,30)
    else 
        self.dy = math.random(30,45)
    end
    if ball.y > self.y then 
        self.y = math.min(VIRTUAL_HEIGHT - 20, self.y + (self.dy * dt))
    elseif ball.y < self.y then 
        self.y = math.max(0, self.y - (self.dy * dt))
    end
end


function AI:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function AI:debug()
    -- if 60 FPS this will be around 3.3 
    --> if speed at 200 pixels and time since update 0.016 (1/60) then 0.016*200 = 3.3
    love.graphics.print("moves at pixels per frame: " ..tostring(self.pixelPerFrame), 200, 200)
    
end


