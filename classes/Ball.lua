Ball = Class{}
local VIRTUAL_HEIGHT = 243

function Ball:init(x, y, width , height)
    self.x = x 
    self.y = y
    self.width = width 
    self.height = height
    self.dx = math.random(2) == 1 and -100 or 100
    self.dy = math.random(-50, 50)
end

function Ball:collides(box)
    if self.x > box.x + box.width or self.x + self.width < box.x then
        return false
    end

    if self.y > box.y + box.height or self.y + self.height < box.y then
        return false
    end
    sounds['paddle_hit']:play()
    return true 
end



function Ball:contain()
    if self.y <= 0 then 
        self.dy = -self.dy
        self.y = 0
        sounds['wall_hit']:play()
    elseif self.y >= VIRTUAL_HEIGHT - 5 then 
        self.dy = -self.dy
        self.y = VIRTUAL_HEIGHT - 5
        sounds['wall_hit']:play()
    end
end

function Ball:playerOneMiss()
    if self.x <= 0 then 
        return true
    else
        return false
    end
end

function Ball:playerTwoMiss()
    if self.x > VIRTUAL_WIDTH - 5 then 
        return true
    else
        return false
    end
end

function Ball:update(dt)
    self.x = self.x + (self.dx*dt)
    self.y = self.y + (self.dy*dt)
end

function Ball:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Ball:reset(serveTo)
    if serveTo == 'playerTwo' then
        self.dx = 100
    elseif serveTo == 'playerOne' then
        self.dx = -100
    else
        self.dx = math.random(2) == 1 and -100 or 100
    end
    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.width / 2)
    self.dy = math.random(-50, 50)
end
