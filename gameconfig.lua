Gameconfig = Object:extend();

function Gameconfig:new()

    love.window.setMode(1024, 768, {resizable=false, vsync=true, minwidth=400, minheight=300})
    love.window.setVSync( 0 )
    self.WINDOW_HEIGHT = love.graphics.getHeight( );
    self.WINDOW_WIDTH =  love.graphics.getWidth( )
    self.LANE_ONE_X = self.WINDOW_WIDTH/2 - 70;
    self.LANE_TWO_X = self.WINDOW_WIDTH/2;
    self.LANE_THREE_X = self.WINDOW_WIDTH/2 + 70;
    self.LANE_Y = -128;
    self.LANE_HITNOTE_Y = self.WINDOW_HEIGHT-150;

    print(string.format("Game Window Width: %d, Height: %d", self.WINDOW_WIDTH, self.WINDOW_HEIGHT))
end