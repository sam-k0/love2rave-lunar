HitNote = Object:extend();
require "extendmath"

function HitNote:new(type, list)
    self.x = 0;
    self.y = GAMECONFIG.LANE_HITNOTE_Y;   
    self.sprite = nil;
    self.sprite_angle = 0;
    self.type = type;
    self.sprite_scale = .5;
    self.actionKey = "";
    self.assignedList = list;
    self.sprite_alpha = 0.5;
    -- Get the type of sprite to assign by type
    if(type == 1) then
        self.sprite = SPRITES.spr_noteLeft;
        self.x = GAMECONFIG.LANE_ONE_X;
        self.actionKey = "left";
    elseif(type == 2) then
        self.sprite = SPRITES.spr_noteUp;
        self.x = GAMECONFIG.LANE_TWO_X;
        self.actionKey = "up";
    elseif (type == 3) then
        self.sprite = SPRITES.spr_noteRight;
        self.x = GAMECONFIG.LANE_THREE_X;
        self.actionKey = "right";
    end

    self.sprite_width = self.sprite:getWidth()
    self.sprite_height = self.sprite:getHeight()
end

function HitNote:update(delta)
    if (love.keyboard.isDown(self.actionKey)) then
        -- Hit the note?
        self.sprite_alpha = 1;
        self:checkNoteCollision(self.assignedList);
    end
    -- Decrease again
    self.sprite_alpha = self.sprite_alpha - 3 * delta;
    self.sprite_alpha = clamp(self.sprite_alpha, 0.5, 1);
    
end

function HitNote:checkNoteCollision(noteList)
    local scaledHeight = self.sprite_height * self.sprite_scale;
    local scaledWidth = self.sprite_width * self.sprite_scale;

    for i=1, #self.assignedList do
        -- Check collision
        local note = self.assignedList[i];
        if(math.abs(note.y - self.y) <= scaledHeight) then
            -- Collision detected
            table.remove(self.assignedList, i);
        end
    end
end


function HitNote:draw()
    local centerx = self.sprite_width/2;
    local centery = self.sprite_height/2;
    local scale = self.sprite_scale;
    love.graphics.setColor(255,255,255, self.sprite_alpha) -- Set drawing to alpha
    love.graphics.draw(self.sprite, self.x, self.y, 0, scale, scale, centerx, centery ,0 ,0);
    love.graphics.setColor(255,255,255, 1); -- Reset alpha
end

