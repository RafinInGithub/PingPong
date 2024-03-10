ball = {}

function ball:load()
    self.sprite = love.graphics.newImage("Assets/Graphics/ball.png")
    self.x = love.graphics.getWidth() / 2 - 15
    self.y = love.graphics.getHeight() / 2 - 15
    self.speed = 300
    self.xVelo = -self.speed
    self.yVelo = 0
end

function ball:update(dt)
    ball:move(dt)
    ball:collide()
end

function ball:move(dt)
    self.x = self.x + self.xVelo * dt
    self.y = self.y + self.yVelo * dt
end

function ball:collide()
    if checkCollision(self, player) then
        self.xVelo = self.speed
        local middleBall = self.y + 40/2
        local middlePlayer = player.y + 120/2
        local collisionPosition = middleBall - middlePlayer
        self.yVelo = collisionPosition * 5
    end

    if checkCollision(self, ai) then
        self.xVelo = -self.speed
        local middleBall = self.y + 40/2
        local middleAi = ai.y + 120/2
        local collisionPosition = middleBall - middleAi
        self.yVelo = collisionPosition * 5
    end

    -- Top down
    if self.y < 0 then
        self.y = 0
        self.yVelo = -self.yVelo
    elseif self.y + 40 > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - 40
        self.yVelo = -self.yVelo
    end

    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - 15
        self.y = love.graphics.getHeight() / 2 - 15
        self.yVelo = 0
        self.xVelo = self.speed   
        score.playerScore2 = score.playerScore2 + 1
    end

    if self.x + 40 > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - 15
        self.y = love.graphics.getHeight() / 2 - 15
        self.yVelo = 0
        self.xVelo = -self.speed
        score.playerScore = score.playerScore + 1
    end
end

function ball:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end
