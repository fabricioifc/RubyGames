require 'gosu'
require './snake'
require './fruit'
require './fruit_rect'

class SnakeGame < Gosu::Window
  WIDTH, HEIGHT = 600, 600
  TILE = 20
  VELOCITY = 1000/15

  WIDTH_IN_TILE = WIDTH/TILE

  def initialize
    super WIDTH, HEIGHT, false, VELOCITY

    @snake = Snake.new
    @fruit = Fruit.new
    # @fruit = FruitRect.new
  end

  def update
    if @snake.x == @fruit.x && @snake.y == @fruit.y
      @fruit.regenerate
      @snake.increase
      self.acelerar
    end
    
    # Tratando colisões
    # percorre do primeiro ao penúltimo, senão da treta
    @snake.posicao[0..-2].each do |x,y|
      reset if x == @snake.x && y == @snake.y
    end

    @snake.update
    @fruit.update

  end

  def draw
    @fruit.draw
    @snake.draw
  end

  def button_down(id)
    case id
      when Gosu::KbUp       then @snake.up
      when Gosu::KbDown     then @snake.down
      when Gosu::KbLeft     then @snake.left
      when Gosu::KbRight    then @snake.right
      when Gosu::KB_ESCAPE  then close
    end
  end

  def acelerar
    self.update_interval -= 5 if self.update_interval >= 40
  end

  def reset
    self.update_interval = VELOCITY
    @snake.reset
  end
  

end

SnakeGame.new.show