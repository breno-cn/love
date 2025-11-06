Player  = {}
Player.__index = Player

function Player:new(x, y)
    local o = {}
    setmetatable(o, Player)

    o.x = x
    o.y = y
    o.dy = 10

    o.width = 20
    o.height = 200

    return o
end

function Player:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Player:moveUp()
    local nextPos = self.y - self.dy
    if nextPos < 0 then
        return
    end

    self.y = nextPos
end

function Player:moveDown()
    local nextPos = self.y + self.dy
    if nextPos > (love.graphics.getHeight() - self.height) then
        return
    end

    self.y = nextPos
end