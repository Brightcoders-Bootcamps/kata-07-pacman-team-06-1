# frozen_string_literal: true

require 'ruby2d'

# Class that make the windows to vizualize the game
class WindowGame
  attr_reader :window

  def initialize
    create_window
    @window = Window
  end

  def create_window
    Window.set(title: 'Pacman Game', background: 'black', width: 645, height: 470, resizable: false)
  end

  def update_window(&block)
    @window.update(&block)
  end
end
