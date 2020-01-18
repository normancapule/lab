# frozen_string_literal: true

class Robot
  TYPES = {
    '1' => 'Terminator',
    '2' => 'HK-47'
  }.freeze
  MESSAGES = {
    '1' => {
      hello: [
        'Your clothes. Now.',
        'I am looking for John Connor.'
      ],
      complain: [
        'Pain can be controlled, you just disconnect it.',
        "I'll be back."
      ]
    },
    '2' => {
      hello: [
        'Nice human, goo-oood human...',
        'Is there someone that you need killed?'
      ],
      complain: [
        "Hey! Y-you... you can't just rip me to pieces! I'll die!!",
        'Ow! I am poking my own eye sockets! Ow! Stop'
      ]
    }
  }

  attr_reader :type, :name

  def initialize(type)
    @type = type
    @name = TYPES[type]
  end

  def complain
    puts "#{name}: #{MESSAGES[type][:complain].sample}"
  end

  def hello
    puts "#{name}: #{MESSAGES[type][:hello].sample}"
    puts ''
  end
end
