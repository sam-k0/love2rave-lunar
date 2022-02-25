-- imports


-- Mit Alt + L ausführen
function love.conf(t) -- Ermöglicht das ausgeben auf der Console
    t.console = true;
end

-- Game Start Event
function love.load() 
    Object = require "lib/classic"
             require "spriteload" -- load sprites
             require "note"

    SPRITES = Spriteload() -- load all sprites
    n1 = Note(1);
end



-- Game Step
function love.update(delta)
    n1:update();    

    
end

-- Game Draw
function love.draw()
    n1:draw()

end

function love.keypressed(key)

end