require 'rubygems'
require 'gosu'
require './player'
require './star'

class Inicio < Gosu::Window

    SCREEN_WIDTH = 640
    SCREEN_HEIGHT = 480
    
    def initialize
      super SCREEN_WIDTH, SCREEN_HEIGHT
      self.caption = "Tutorial Game"
  
      @background_image = Gosu::Image.new("media/space.png", :tileable => true)
      @font = Gosu::Font.new(self, "Nimbus Mono L", SCREEN_HEIGHT / 15)
      self.text_input = Gosu::TextInput.new
  
      @player = Player.new
      @player.name = "Fabricio"
      self.text_input.text = @player.name
    end
  
    def update
      
    end
  
    def draw
        @background_image.draw(0, 0, 0)
        # @font.draw(self.text_input.text, 20, 40, 0)
        w = (SCREEN_WIDTH / 2) - self.text_input.text.size
        h = SCREEN_HEIGHT / 2
        draw_text(w, h, self.text_input.text, @font, 0xffffd700)
    end
  
    def button_down(id)
      
    end

    def draw_text(x, y, text, font, color)
        font.draw(text, x, y, 3, 1, 1, color)
    end
    
  end
  
  Inicio.new.show