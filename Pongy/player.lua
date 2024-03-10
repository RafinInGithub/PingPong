player = {}

function player:load()
    self.sprite = love.graphics.newImage("Assets/Graphics/paddle.png")
    self.x = 50
    self.y = love.graphics.getHeight() / 2 - 60
    self.speed = 500
end

function player:update(dt)
    player:move(dt)
    player:checkBorders()
end

function player:move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function player:checkBorders()
    if self.y < 0 then
        self.y = 0
    elseif self.y + 120 > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - 120
    end
end

function player:draw()
    -- Background
    love.graphics.setColor(0.557, 0.451, 1)
    love.graphics.rectangle("fill", 0, 0, 1100, 600)

    -- BG line
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", love.graphics.getWidth() / 2, 100, 10, 400)
    
    -- Player
    love.graphics.draw(self.sprite, self.x, self.y)
end
