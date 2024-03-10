menu = {}

function menu:load()
    self.font = love.graphics.newFont("Assets/Fonts/SpeedyRegular-7BLoE.ttf", 100)
    self.font2 = love.graphics.newFont("Assets/Fonts/SpeedyRegular-7BLoE.ttf", 70)
    self.icon = love.graphics.newImage("Assets/Graphics/menuIcon.png")
end

function menu:draw()
    -- Background
    love.graphics.setColor(0.557, 0.451, 1)
    love.graphics.rectangle("fill", 0, 0, 1100, 600)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(self.font)
    love.graphics.print("Pongy", love.graphics.getWidth() / 2 - 200, 20)

    love.graphics.setFont(self.font2)
    
    love.graphics.draw(self.icon, 0, 0)
    love.graphics.print("Press Space", 50, 460)
end
