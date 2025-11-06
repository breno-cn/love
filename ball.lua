require('utils')

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
    local nextPos = {
        x = self.x + self.dx,
        y = self.y + self.dy
    }

    if Collides(nextPos, game.player1) or Collides(nextPos, game.player2) then
        self.dx = self.dx * -1
        self.dy = self.dy * -1

        return
    end

    if nextPos.x <= game.player1.x then
        game.score2 = game.score2 + 1
        self:reset()

        return
    end

    if nextPos.x >= game.player2.x + game.player2.width then
        game.score1 = game.score1 + 1
        self:reset()

        return
    end

    if nextPos.y >= love.graphics.getHeight() or nextPos.y <= 0 then
        self.dy = self.dy * -1
    end

    self.x = nextPos.x
    self.y = nextPos.y
end
