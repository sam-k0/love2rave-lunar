-- imports


-- Mit Alt + L ausführen
function love.conf(t) -- Ermöglicht das ausgeben auf der Console
    t.console = true;
end

-- Game Start Event
function love.load() 
    Object = require "lib/classic"
             require "extendmath"
             require "gameconfig"
             require "spriteload" -- load sprites
             require "note"
             require "hitnote"

    SPRITES = Spriteload(); -- load all sprites
    GAMECONFIG = Gameconfig();

    NoteListLeft = {};
    NoteListRight = {};
    NoteListMid = {};
    table.insert(NoteListLeft, Note(1));
    table.insert(NoteListMid, Note(2));
    table.insert(NoteListRight, Note(3));

    OBJECTS = {};

    LeftBtn = HitNote(1, NoteListLeft);
    MidBtn = HitNote(2, NoteListMid);
    RightBtn = HitNote(3, NoteListRight);

    table.insert(OBJECTS, LeftBtn);
    table.insert(OBJECTS, MidBtn);
    table.insert(OBJECTS, RightBtn);
end



-- Game Step
function love.update(delta)
    for i=1, #NoteListLeft do
        NoteListLeft[i]:update(delta);
    end

    for i=1, #NoteListRight do
        NoteListRight[i]:update(delta);
    end

    for i=1, #NoteListMid do
        NoteListMid[i]:update(delta);
    end

    for i=1, #OBJECTS do
        OBJECTS[i]:update(delta);
    end
end

-- Game Draw
function love.draw()
    for i=1, #NoteListLeft do
        NoteListLeft[i]:draw();
    end

    for i=1, #NoteListRight do
        NoteListRight[i]:draw();
    end

    for i=1, #NoteListMid do
        NoteListMid[i]:draw();
    end

    for i=1, #OBJECTS do
        OBJECTS[i]:draw();
    end
end

