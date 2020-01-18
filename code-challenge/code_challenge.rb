# frozen_string_literal: true

require_relative 'lib/intro'
require_relative 'lib/robot'
require_relative 'lib/game'
require_relative 'lib/board'

chosen_robot = Intro.new.call
Game.new(chosen_robot).call
