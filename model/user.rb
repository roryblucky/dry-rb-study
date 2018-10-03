# frozen_string_literal: true

require_relative './city_state'
require_relative  './city'
require_relative  './address'
class User
  attr_accessor :address

  def initialize(address)
    @address = address
  end

  class << self
    def find(_id)
      state = CityState.new('weibin')
      city = City.new(state)
      address = Address.new(city)
      User.new(address)
    end
  end
end
