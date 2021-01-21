# frozen_string_literal: true

require_relative '../app/fruit'
require 'ruby2d'

RSpec.describe Fruit do
  before do
    @fruit = Fruit.new(213, 46)
  end

  describe '.instance of fruit' do
    it 'check if @fruit varibale is an instance of Fruit' do
      expect(@fruit).to be_an_instance_of(Fruit)
    end
  end

  describe '.get_coordinates' do
    it 'return x and y coordinates' do
      expect(@fruit.get_coordinates).to eq [213, 46]
    end
  end
end
