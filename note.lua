Note = Object:extend();

function Note:new(type, ystart)
    self.x = 0;
    self.y = ystart; --GAMECONFIG.LANE_Y+ math.random(0,100);   
    self.speed = 200; 
    self.sprite = nil;
    self.sprite_angle = 0;
    self.type = type;
    self.sprite_scale = .5;
    -- Get the type of sprite to assign by type
    if(type == 1) then
        self.sprite = SPRITES.spr_noteLeft;
        self.x = GAMECONFIG.LANE_ONE_X;
        self.sprite_angle = -180;
    elseif(type == 2) then
        self.sprite = SPRITES.spr_noteUp;
        self.x = GAMECONFIG.LANE_TWO_X;
    elseif (type == 3) then
        self.sprite = SPRITES.spr_noteRight;
        self.x = GAMECONFIG.LANE_THREE_X;
        self.sprite_angle = 90;
    end

    self.sprite_width = self.sprite:getWidth()
    self.sprite_height = self.sprite:getHeight()
end

function Note:update(delta)
    self.y = self.y + self.speed * delta;

end

function Note:draw()
    local centerx = self.sprite_width/2;
    local centery = self.sprite_height/2;
    local scale = self.sprite_scale;

    love.graphics.draw(self.sprite, self.x, self.y, 0, scale, scale, centerx, centery ,0 ,0);
end