# typed: strict
# frozen_string_literal: true

require_relative 'lib/printer'
require_relative 'lib/dog_printer'

class BasicObject
  extend T::Sig
end

class Demo
  sig { params(printer: T.any(Printer, DogPrinter)).returns(NilClass) }
  def print_hello(printer:)
    printer.print_output
  end
end

Demo.new.print_hello(printer: Printer.new)
Demo.new.print_hello(printer: DogPrinter.new)

class Man
  sig { params(type: String).returns(T.any(Integer, Float)) }
  def move(type:)
    case type
    when 'walk' then walk
    when 'run' then run
    end
  end

  sig { returns(Integer) }
  def walk
    100
  end

  sig { returns(Float) }
  def run
    100.0
  end
end

class Nards < Man
end

Man.new.move(type: 'walk')
