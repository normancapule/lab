# frozen_string_literal: true

class Board
  PLACEMENT_REGEX = /PLACE\ \d,\d,(NORTH|SOUTH|WEST|EAST)/.freeze
  ORIENTATION_REGEX = /(LEFT|RIGHT)/.freeze
  MOVEMENT_REGEX = /(MOVE)/.freeze
  DIRECTIONS = {
    'NORTH' => [0],
    'EAST' => [90, -270],
    'SOUTH' => [180, -180],
    'WEST' => [270, -90]
  }.freeze
  ORIENTATIONS = {
    'LEFT' => -90,
    'RIGHT' => 90
  }.freeze

  attr_reader :width, :height, :location, :robot

  def initialize(robot:, width:, height:)
    @width = width
    @height = height
    @robot = robot
    @location = {
      robot.name.to_s => {}
    }
  end

  def parse_command(command)
    if command.match(PLACEMENT_REGEX) || location[robot.name].empty?
      return robot.complain unless update_placement(command: command)

      return true
    end
    if command.match(ORIENTATION_REGEX)
      update_orientation(command: command)
      return true
    end
    if command.match(MOVEMENT_REGEX)
      return robot.complain unless update_movement

      return true
    end
    report_location if command == 'REPORT'
    false
  end

  private

  def update_orientation(command:)
    orientation_value = ORIENTATIONS[command]
    current_orientation = location[robot.name][:orientation]
    new_orientation_value = current_orientation + orientation_value
    new_orientation_value = 0 if new_orientation_value.abs == 360

    location[robot.name][:orientation] = new_orientation_value
  end

  def update_placement(command:)
    return unless command.match(PLACEMENT_REGEX)

    parsed = parse_placement(command)
    new_location = {
      x: parsed[0].to_i,
      y: parsed[1].to_i,
      orientation: DIRECTIONS[parsed[2]].first
    }
    return unless valid_location?(new_location)

    location[robot.name] = new_location
  end

  def update_movement
    new_location = movement_changes
    return unless valid_location?(new_location)

    @location[robot.name] = new_location
  end

  def movement_changes
    new_location = location[robot.name].dup
    case orientation_name
    when 'NORTH' then new_location[:y] += 1
    when 'WEST' then new_location[:x] -= 1
    when 'EAST' then new_location[:x] += 1
    when 'SOUTH' then new_location[:y] -= 1
    end
    new_location
  end

  def valid_location?(new_location)
    return if new_location[:x].negative? || new_location[:x] >= width
    return if new_location[:y].negative? || new_location[:y] >= height

    true
  end

  def parse_placement(command)
    parsed = command.gsub(/PLACE\ /, '')
    parsed.split(',')
  end

  def orientation_name
    DIRECTIONS.each do |key, value|
      return key if value.include?(location[robot.name][:orientation])
    end
  end

  def report_location
    puts "#{location[robot.name][:x]},#{location[robot.name][:y]},#{orientation_name}"
  end
end
