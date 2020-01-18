# frozen_string_literal: true

class Intro
  def call
    puts 'Welcome to Shadow robotics. Please select your robot:'
    puts 'Choices'
    Robot::TYPES.each do |k, v|
      puts "#{k} - #{v}"
    end

    loop do
      @chosen_robot = gets.strip
      break if correct_choice?(chosen_robot)
    end

    puts "You have chosen: #{Robot::TYPES[chosen_robot]}"

    Robot.new(chosen_robot)
  end

  attr_reader :chosen_robot

  private

  def correct_choice?(response)
    unless Robot::TYPES.keys.include?(response)
      puts 'Please choose again'
      return
    end
    true
  end
end
