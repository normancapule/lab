# typed: strict
# frozen_string_literal: true

class DogPrinter
  extend T::Sig
  sig {returns(NilClass)}
  def print_output
    puts 'woof'
  end
end
