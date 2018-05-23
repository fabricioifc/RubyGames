require 'rubygems'
require 'pry'

class Fruit
    attr_accessor :x, :y, :fruits
    
    def initialize
      @x = rand(SnakeGame::WIDTH / SnakeGame::TILE)
      @y = rand(SnakeGame::WIDTH / SnakeGame::TILE)

      @fruits = {
        morango: Gosu::Image.new("media/strawberry.png"),
        cereja: Gosu::Image.new("media/cereja.png")
      }
      @image = @fruits.to_a[rand(@fruits.size)].last
    end

    def update
    end

    def draw
        @image.draw(
            @x * SnakeGame::TILE,
            @y * SnakeGame::TILE,
            0
        )
    end

    def regenerate
        # @x = (rand * SnakeGame::TILE).floor
        # @y = (rand * SnakeGame::TILE).floor
        @x = rand(SnakeGame::WIDTH / SnakeGame::TILE)
        @y = rand(SnakeGame::HEIGHT / SnakeGame::TILE)
        @image = @fruits.to_a[rand(@fruits.size)].last
    end
    

    def up;     @velx = 0;  @vely = -1 end
    def down;   @velx = 0;  @vely = 1  end
    def left;   @velx = -1; @vely = 0 end
    def right;  @velx = 1;  @vely = 0  end
        
end