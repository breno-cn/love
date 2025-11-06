function Collides(b1, b2)
    return b1.x >= b2.x and b1.x <= (b2.x + b2.width) and b1.y >= b2.y and b1.y <= (b2.y + b2.height)
end