-- imports


-- Mit Alt + L ausführen
function love.conf(t) -- Ermöglicht das ausgeben auf der Console
    t.console = true;
end

-- Game Start Event
function love.load() 
    GameStarted = false;
    Object = require "lib/classic"          print("Loading lib/classic")
             require "lib/extendmath"       print("Loading lib/extendmath")
             require "gameconfig"           print("Loading gameconfig")
             require "spriteload"           print("Loading spriteload")
             require "note"                 print("Loading note")
             require "hitnote"              print("Loading hitnote")
    Json  =  require "lib/json"             print("Loading lib/json")
             require "lib/FileInputOutput"  print("Loading lib/FileInputOutput")
             require "soundmgr"             print("Loading soundmgr")
             print("Using love2d ",(love.getVersion()))

    SPRITES = Spriteload(); -- load all sprites
    GAMECONFIG = Gameconfig();
    SOUNDMANAGER = Soundmanager();
    GameStarted = Soundmanager:playSong(); -- Song started
    print(GameStarted)
    -- Lists of notes
    NoteListLeft = {};
    NoteListRight = {};
    NoteListMid = {};
    -- Spawn some notes by hand
    --table.insert(NoteListLeft, Note(1, -500));
    --table.insert(NoteListMid, Note(2, 0));
    --table.insert(NoteListRight, Note(3, 0));

    OBJECTS = {};

    LeftBtn = HitNote(1, NoteListLeft);
    MidBtn = HitNote(2, NoteListMid);
    RightBtn = HitNote(3, NoteListRight);

    table.insert(OBJECTS, LeftBtn);
    table.insert(OBJECTS, MidBtn);
    table.insert(OBJECTS, RightBtn);
    -- Read notes from file
    rnl = {}
    rnm = {}
    rnr = {}

    rnl, rnm, rnr = read_chart(read_file("chart.l2r"))
    -- Spawn read note timestamps
    offMulti = 2;
    offAdd = 300;
    local count = 0;
    for i = 1, #rnl do
        print(rnl[i])
        count = count + 1;
        table.insert(NoteListLeft, Note(1, -1 * tonumber(rnl[i]) * offMulti + offAdd));
    end

    for i = 1, #rnm do
        print(rnm[i])
        count = count + 1;
        table.insert(NoteListMid, Note(2, -1 * tonumber(rnm[i]) * offMulti + offAdd));
    end

    for i = 1, #rnr do
        print(rnr[i])
        count = count + 1;
        table.insert(NoteListRight, Note(3, -1 * tonumber(rnr[i]) * offMulti + offAdd));
    end

    print(count)

end


-- Game Step
function love.update(delta)
    if( GameStarted == true) then
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

    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end

function love.keypressed(key, scancode, isrepeat)
    if(key == "left") then
        LeftBtn:checkNoteCollision(LeftBtn.assignedList);
    elseif (key == "up") then
        MidBtn:checkNoteCollision(MidBtn.assignedList);
    elseif(key == "right") then
        RightBtn:checkNoteCollision(RightBtn.assignedList);
    end
end

