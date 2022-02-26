-- imports


-- Mit Alt + L ausführen
function love.conf(t) -- Ermöglicht das ausgeben auf der Console
    t.console = true;
end

-- Game Start Event
function love.load() 
    Object = require "lib/classic"
             require "gameconfig"
             require "spriteload" -- load sprites
             require "note"

    SPRITES = Spriteload(); -- load all sprites
    GAMECONFIG = Gameconfig();

    NoteList = {};
    table.insert(NoteList, Note(1));
    table.insert(NoteList, Note(2));
    table.insert(NoteList, Note(3));

end



-- Game Step
function love.update(delta)
    for i=1, #NoteList do
        NoteList[i]:update(delta);
    end
end

-- Game Draw
function love.draw()
    for i=1, #NoteList do
        NoteList[i]:draw();
    end

end

function love.keypressed(key)

end