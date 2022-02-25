Spriteload = Object:extend();

function Spriteload:new()
    s = self;
    s.spr_noteLeft = love.graphics.newImage("sprite/left.png");
    s.spr_noteRight = love.graphics.newImage("sprite/right.png");
    s.spr_noteUp = love.graphics.newImage("sprite/up.png")
end