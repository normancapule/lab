# typed: strict
# frozen_string_literal: true

class Printer
  extend T::Sig
  sig {returns(NilClass)}
  def print_output
    puts 'Boop Beep printing'
  end
end
