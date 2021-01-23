# frozen_string_literal: true

require_relative '../app/pacman'
require_relative '../app/shapes_factory'
require 'ruby2d'
require 'rspec'

RSpec.describe Pacman do
  before do
    @pacman = Pacman.new(30, 30)
    @fruit = ShapesFactory.create_shape('fruit', 30, 30)
    @wall = ShapesFactory.create_shape('wall', 30, 30)
  end

  describe '.instance of pacman' do
    it 'check if @pacman varibale is an instance of Pacman' do
      expect(@pacman).to be_an_instance_of(Pacman)
    end
  end

  #for fruits collision with pacman
  describe '.check_intersect_circle' do
    it 'return true' do
      expect(@pacman.intersect_circle?(@fruit.fruit)).to eq true
    end
  end

  #for internal wall collision with pacman
  describe '.check_intersect_square' do
    it 'return true' do
      expect(@pacman.intersect_square?(@wall.wall2d)).to eq true
    end
  end

  #for border of the game collision with pacman
  describe '.check_intersect_border' do
    it 'return true' do
      expect(@pacman.intersect_border?).to eq true
    end
  end

end
