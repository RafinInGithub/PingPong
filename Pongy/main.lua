require("player")
require("ball")
require("ai")
require("score")
require("menu")

gameState = "MenuState"

function love.load()
    -- Set image filter
    love.graphics.setDefaultFilter("linear", "linear", 4)

    player:load()
    ball:load()
    ai:load()
    score:load()
    menu:load()
end

function love.update(dt)
    if gameState == "AiState" then
        player:update(dt)
        ball:update(dt)
        ai:update(dt)
    end
end

function checkCollision(a, b)
    if a.x + 40 > b.x and a.x < b.x + 20 and a.y + 40 > b.y and a.y < b.y + 120 then
        return true
    else
        return false
    end
end

function love.draw()
    if gameState == "AiState" then
        player:draw()
        ball:draw()
        ai:draw()
        score:draw()
    end

    if gameState == "MenuState" then
        menu:draw()
    end
end

function love.keypressed(key)
    if gameState == "MenuState" then
        if key == "space" then
            gameState = "AiState"
        end
    end
end
