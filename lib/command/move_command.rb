# frozen_string_literal: true

require_relative 'base_command'

#
# Represents the Move command to move a robot one space forward in the direction it is facing
# Syntax: MOVE
#
class MoveCommand < BaseCommand
  MOVE = 'MOVE'

  def self.from_string(command_str)
    raise ArgumentError, 'Not a valid MOVE command' unless command_str.strip == MOVE

    new
  end

  def execute(robot)
    robot.move
  end
end
