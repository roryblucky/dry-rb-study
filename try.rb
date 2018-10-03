# frozen_string_literal: true

require 'dry/monads/try'

module ExceptionalLand
  extend Dry::Monads::Try::Mixin

  res = Try() { 10 / 2 }

  data = res.value! if res.value?

  p data # should be 5

  res = Try() { 10 / 5 }.bind { |x| x * 2 }

  p res # should be 4

  res = Try() { 10 / 0 }
  ex = res.exception if res.error?

  p ex # exception

  # By default Try catches all exceptions inherited from StandardError.
  # but we can catch only the exceptions what we care about

  Try(NoMethodError, NotImplementedError) { 10 / 0 } # raise exception
end
