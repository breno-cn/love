Ball = {}
Ball.__index = Ball

function Ball:new()
    local o = {}
    setmetatable(o, Ball)

    o:reset()

    self.width = 10
    self.height = 10

    return o
end

function Ball:reset()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    
    self.dx = 4
    self.dy = 4

    if math.random(0, 1) == 0 then
        self.dx = self.dx * -1
    end

    if math.random(0, 1) == 0 then
        self.dy = self.dy * -1
    end
end

function Ball:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Ball:move(game)
    local nextX = self.x + self.dx
    local nextY = self.y + self.dy

    if nextX <= 0 then
        game.score2 = game.score2 + 1
        self:reset()
        print("score player 2")

        return
    end

    if nextX >= love.graphics.getWidth() then
        game.score1 = game.score1 + 1
        self:reset()
        print("score player 1")

        return
    end

    local player2 = game.player2
    if nextX >= player2.x and nextX <= (player2.x + player2.width) and nextY >= player2.y and nextY <= (player2.y + player2.height) then
        self.dx = self.dx * -1
        self.dy = self.dy * -1

        return
    end

    local player1 = game.player1
    if nextX >= player1.x and nextX <= (player1.x + player1.width) and nextY >= player1.y and nextY <= (player1.y + player1.height) then
        self.dx = self.dx * -1
        self.dy = self.dy * -1

        return
    end

    if nextY >= love.graphics.getHeight() or nextY <= 0 then
        self.dy = self.dy * -1
    end

    self.x = self.x + self.dx
    self.y = self.y + self.dy
end
