# frozen_string_literal: true

require 'dry/monads/result'

class ResultCalculator
  include Dry::Monads::Result::Mixin

  attr_accessor :input
  attr_reader :divide_input

  def initialize
    @divide_input = ->(input) { 10 / input }
  end

  def calculate
    i = Integer(input)

    Success(divide_input.call(i)).bind do |value|
      if value > 1
        Success(value + 1)
      else
        Failure('value was less than 1')
      end
    end.bind do |value|
      if value.even?
        Success(value * 2)
      else
        Failure('value was not even')
      end
    end
  end
end

r = ResultCalculator.new
r.input = 5
p r.calculate
