class Fruit
    attr_accessor :x, :y
    def initialize
      @x = 15
      @y = 15
    end

    def update
    end

    def draw
        Gosu.draw_rect(
            @x * SnakeGame::TILE,
            @y * SnakeGame::TILE,
            SnakeGame::TILE - 1,
            SnakeGame::TILE - 1,
            Gosu::Color::RED
        )
    end

    def regenerate
        @x = (rand * SnakeGame::TILE).floor
        @y = (rand * SnakeGame::TILE).floor
    end
    

    def up;     @velx = 0;  @vely = -1 end
    def down;   @velx = 0;  @vely = 1  end
    def left;   @velx = -1; @vely = 0 end
    def right;  @velx = 1;  @vely = 0  end
        
end