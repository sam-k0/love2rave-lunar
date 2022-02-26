-- imports


-- Mit Alt + L ausführen
function love.conf(t) -- Ermöglicht das ausgeben auf der Console
    t.console = true;
end

-- Game Start Event
function love.load() 
    Object = require "lib/classic"          print("Loading lib/classic")
             require "lib/extendmath"       print("Loading lib/extendmath")
             require "gameconfig"           print("Loading gameconfig")
             require "spriteload"           print("Loading spriteload")
             require "note"                 print("Loading note")
             require "hitnote"              print("Loading hitnote")
    Json  =  require "lib/json"             print("Loading lib/json")
             require "lib/FileInputOutput"  print("Loading lib/FileInputOutput")

    SPRITES = Spriteload(); -- load all sprites
    GAMECONFIG = Gameconfig();
    -- Lists of notes
    NoteListLeft = {};
    NoteListRight = {};
    NoteListMid = {};
    -- Spawn some notes by hand
    table.insert(NoteListLeft, Note(1, -500));
    table.insert(NoteListMid, Note(2, 0));
    table.insert(NoteListRight, Note(3, 0));

    OBJECTS = {};

    LeftBtn = HitNote(1, NoteListLeft);
    MidBtn = HitNote(2, NoteListMid);
    RightBtn = HitNote(3, NoteListRight);

    table.insert(OBJECTS, LeftBtn);
    table.insert(OBJECTS, MidBtn);
    table.insert(OBJECTS, RightBtn);

    --[[if(file_exists("sus.txt")) then
        local lines = lines_from("sus.txt");
        print(lines[1])
        local jstr = lines[1];
        print(jstr)
        local decodedJ = {};
       decodedJ = Json.parse(jstr)
        
        for i = 1, #decodedJ do
            print(decodedJ[i])
        end
    end]]
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

