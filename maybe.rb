# frozen_string_literal: true

require 'dry/monads/maybe'

require_relative './model/user'

user = User.find(1)

address = user.address if user.address

city = address.city if address

state = city.state if city

state_name = state.name if state

user_state = state_name || 'No state'

p user_state

# ##############dry-monads Maybe#######

maybe_user = Dry::Monads.Maybe(User.find(2)).fmap(&:address).fmap(&:city).fmap(&:state).fmap(&:name)

puts "maybe user state: #{maybe_user.value_or('Default state')}"
