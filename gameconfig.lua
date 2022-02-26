Gameconfig = Object:extend();

function Gameconfig:new()
    self.WINDOW_HEIGHT = love.graphics.getHeight( );
    self.WINDOW_WIDTH =  love.graphics.getWidth( )
    self.LANE_ONE_X = self.WINDOW_WIDTH/2 - 150;
    self.LANE_TWO_X = self.WINDOW_WIDTH/2;
    self.LANE_THREE_X = self.WINDOW_WIDTH/2 + 150;
    self.LANE_Y = -128;
    print(string.format("Game Window Width: %d, Height: %d", self.WINDOW_WIDTH, self.WINDOW_HEIGHT))
end