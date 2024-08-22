# frozen_string_literal: true

require_relative 'base_command'

#
# Represents the Left command to turn the robot 90 degrees to the left
# Syntax: LEFT
#
class LeftCommand < BaseCommand
  LEFT = 'LEFT'

  def self.from_string(command_str)
    raise ArgumentError, 'Not a valid LEFT command' unless command_str.strip == LEFT

    new
  end

  def execute(robot)
    robot.left
  end
end
