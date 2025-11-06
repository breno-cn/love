Game = {}
Game.__index = Game

function Game:new(player1, player2)
    local o = {}
    setmetatable(o, Game)

    o.player1 = player1
    o.player2 = player2

    o.score1 = 0
    o.score2 = 0

    return o
end
