class Snake
    attr_accessor :x, :y
    attr_reader :posicao

    MIN_TAIL = 3 #Cauda mínima

    def initialize
      @x = 10
      @y = 10

      @velx = 0
      @vely = 0

      @tail = MIN_TAIL
      @posicao = []
    end

    def update
      @x += @velx
      @y += @vely

      # Volta ao inicio da tela caso chegue ao final
      @x = 0 if @x >= SnakeGame::WIDTH_IN_TILE
      @x = SnakeGame::WIDTH_IN_TILE if @x < 0
      @y = 0 if @y >= SnakeGame::WIDTH_IN_TILE
      @y = SnakeGame::WIDTH_IN_TILE if @y < 0

      # Adiciona a posição da cobra
      @posicao << [@x, @y]

      # Remove a primeira posição para dar impressão de movimento
      @posicao.shift until @posicao.size <= @tail
    end

    def draw
      @posicao.each do |x,y|
        Gosu.draw_rect(
          x * SnakeGame::TILE,
          y * SnakeGame::TILE,
          SnakeGame::TILE - 1,
          SnakeGame::TILE - 1,
          self.snake_color
        ) 
      end
    end

    def increase
       @tail += 1 
    end

    def reset
      @tail = MIN_TAIL
    end

    def snake_color
      return Gosu::Color::BLUE if @posicao.size > 5
      return Gosu::Color::GREEN
    end    

    def up;     @velx = 0; @vely = -1 end
    def down;   @velx = 0; @vely = 1 end
    def left;   @velx = -1; @vely = 0 end
    def right;  @velx = 1; @vely = 0 end
        
end