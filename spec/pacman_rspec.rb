# frozen_string_literal: true

require_relative '../app/pacman'
require 'ruby2d'
require 'rspec'

RSpec.describe Pacman do
	before do 
		@pacman = Pacman.new(30,30) 
	end

	describe '.instance of pacman' do
		it 'check if @pacman varibale is an instance of Pacman' do
			expect(@pacman).to be_an_instance_of(Pacman)
		end
	end

  describe '.move_x' do
    it 'plus or minus one to x_position' do
      expect(@pacman.move_x(1)).to eq 31
    end
  end

  describe '.move_y' do
    it 'minus one to y_position' do
      expect(@pacman.move_x(-1)).to eq 29
    end
  end

  describe '.get_coordinates' do
    it 'returns x and y coordinates' do
      expect(@pacman.get_coordinates).to eq [30,30]
    end
  end
end