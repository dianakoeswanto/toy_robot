# frozen_string_literal: true

require_relative 'command/left_command'
require_relative 'command/move_command'
require_relative 'command/place_command'
require_relative 'command/report_command'
require_relative 'command/right_command'

#
# Processes the command based on the command input string
#
class CommandProcessor
  def initialize(robot)
    @robot = robot
  end

  def process(command_str)
    command = build_command(command_str)
    command&.execute(@robot)
  end

  private

  def build_command(command_str)
    case command_str
    when /#{Regexp.quote(PlaceCommand::PLACE)}/ then PlaceCommand.from_string(command_str)
    when MoveCommand::MOVE then MoveCommand.from_string(command_str)
    when LeftCommand::LEFT then LeftCommand.from_string(command_str)
    when RightCommand::RIGHT then RightCommand.from_string(command_str)
    when ReportCommand::REPORT then ReportCommand.from_string(command_str)
    else puts 'Please enter a valid command'
    end
  rescue ArgumentError => e
    puts e.message
  end
end
