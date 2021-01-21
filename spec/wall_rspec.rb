# frozen_string_literal: true

require_relative '../app/wall'
require 'ruby2d'

RSpec.describe Wall do
  before do
    @wall = Wall.new(150, 150)
  end

  describe '.instance of square' do
    it 'check if @wall.walld2 is an instance of Square' do
      expect(@wall.wall2d).to be_an_instance_of(Square)
    end
  end

  describe '.remove' do
    it 'check if the remove method works' do
      expect(@wall.remove).to eq true
    end
  end
end
