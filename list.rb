# frozen_string_literal: true

require 'dry/monads/list'

M = Dry::Monads

p M::List[M::Success(1), M::Success(2)].typed(M::Result).traverse # =>Success(List[1,2])
p M::List[M::Maybe(1), M::Maybe(nil), M::Maybe(3)].typed(M::Maybe).traverse # => None

p M::List[1, 2].fmap { |x| M::Success(x + 1) }.typed(M::Result).traverse #=> Success(List[2,3])
p M::List[1, nil, 3].fmap { |x| M::Maybe(x) }.typed(M::Maybe).traverse #=> NONE
