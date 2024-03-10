score = {}

function score:load()
    self.playerScore = 0
    self.playerScore2 = 0
    self.font = love.graphics.newFont("Assets/Fonts/SpeedyRegular-7BLoE.ttf", 60)
end

function score:draw()
    love.graphics.setFont(self.font)
    love.graphics.print(self.playerScore .. "-" .. self.playerScore2, love.graphics.getWidth() / 2 - 60, 10)
end
