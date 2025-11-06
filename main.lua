require('player')
require('ball')
require('game')

function love.load()
    local y = (love.graphics.getHeight() / 2) - 100

    Player1 = Player:new(20, y)
    Player2 = Player:new(love.graphics.getWidth() - 40, y)

    math.randomseed(os.time())
    local font = love.graphics.newFont(64) 
    love.graphics.setFont(font)

    Ball = Ball:new()

    Game = Game:new(Player1, Player2)
end

function love.draw()
    Player1:draw()
    Player2:draw()

    Ball:draw()

    love.graphics.setColor(1, 1, 1) 

    love.graphics.printf(Game.score1, 0, 50, love.graphics.getWidth() / 2, "center")
    love.graphics.printf(Game.score2, love.graphics.getWidth() / 2, 50, love.graphics.getWidth() / 2, "center")
end

function love.update(delta_time)
    if love.keyboard.isDown("w") then
        Player1:moveUp()
    end

    if love.keyboard.isDown("s") then
        Player1:moveDown()
    end

    if love.keyboard.isDown("up") then
        Player2:moveUp()
    end
    
    if love.keyboard.isDown("down") then
        Player2:moveDown()
    end

    Ball:move(Game)
end
