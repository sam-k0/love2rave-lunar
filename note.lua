Note = Object:extend();

function Note:new(type)
    self.x = 0;
    self.y = 0;   
    self.speed = 0; 
    self.sprite = nil;
    -- Get the type of sprite to assign by type
    if(type == 1) then
        self.sprite = SPRITES.spr_noteLeft;
    elseif(type == 2) then
        self.sprite = SPRITES.spr_noteUp;
    elseif (type == 3) then
        self.sprite = SPRITES.spr_noteRight;
    end

    
    self.sprite_width = self.sprite:getWidth()
    self.sprite_height = self.sprite:getHeight()
end

function Note:update(dt)
    self.y = self.y + self.speed;

end

function Note:draw()
    local centerx = self.sprite_width/2;
    local centery = self.sprite_height/2;
    local scale = .5;

    love.graphics.draw(self.sprite, self.x, self.y, 0, scale, scale, centerx, centery ,0 ,0);
end