# require 'dry/monads/maybe'

require_relative './model/user'

user = User.find(1)

p user