# frozen_string_literal: true

require_relative 'base_command'

#
# Represents the Right command to turn the robot 90 degrees to the right
# Syntax: RIGHT
#
class RightCommand < BaseCommand
  RIGHT = 'RIGHT'

  def self.from_string(command_str)
    raise ArgumentError, 'Not a valid RIGHT command' unless command_str.strip == RIGHT

    new
  end

  def execute(robot)
    robot.right
  end
end
