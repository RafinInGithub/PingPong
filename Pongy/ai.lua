ai = {}

function ai:load()
    self.sprite = love.graphics.newImage("Assets/Graphics/paddle.png")
    self.x = love.graphics.getWidth() - 40 - 50
    self.y = love.graphics.getHeight() / 2 - 60
    self.yVelo = 0
    self.speed = 500
    self.timer = 0
    self.rate = 0.15
end

function ai:update(dt)
    ai:move(dt)
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        ai:getTarget()
    end
end

function ai:move(dt)
    self.y = self.y + self.yVelo * dt
end

function ai:getTarget()
    if ball.y + 40 < self.y then
        self.yVelo = -self.speed
    elseif ball.y > self.y + 120 then
        self.yVelo = self.speed
    else
        self.yVelo = 0
    end
end

function ai:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end
