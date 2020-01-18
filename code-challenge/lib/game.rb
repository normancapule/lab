# frozen_string_literal: true

class Game
  attr_reader :robot, :board

  def initialize(robot)
    @robot = robot
    @robot.hello
    @board = Board.new(robot: @robot, width: 5, height: 5)
  end

  def call
    ask_placement_loop
    command_loop
  end

  private

  def ask_placement_loop
    puts 'Your robot is ready! Please place it in the board.'
    puts 'Command: PLACE <x>,<y>,<orientation>'
    loop do
      command = gets.strip
      board.parse_command(command)
      break unless board.location[robot.name].empty?
    end
  end

  def command_loop
    puts 'Now move your robot. Commands: LEFT,RIGHT,MOVE,EXIT'
    loop do
      command = gets.strip
      break if command == 'EXIT'

      board.parse_command(command)
    end
  end
end
