# frozen_string_literal: true

require_relative 'base_command'

#
# Represents the Report command that prints the robot's position and orientation
# Syntax: REPORT
# Prints: Output: x,y,orientation
#
class ReportCommand < BaseCommand
  REPORT = 'REPORT'

  def self.from_string(command_str)
    raise ArgumentError, 'Not a valid REPORT command' unless command_str.strip == REPORT

    new
  end

  def execute(robot)
    puts "Output: #{[robot.x_coord, robot.y_coord, robot.orientation.upcase].join(',')}" if robot.placed?
  end
end
