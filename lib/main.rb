# frozen_string_literal: true

require_relative 'model/robot'
require_relative 'command_processor'

#
# Main class that will read input from console and processes them
#
class Main
  def start
    display_welcome_message
    robot = Robot.new
    command_processor = CommandProcessor.new(robot)

    loop do
      command_str = read_command
      break if command_str == 'EXIT'

      command_processor.process(command_str)
    end
  rescue SystemExit, Interrupt
    puts 'Bye!'
  end

  private

  def display_welcome_message
    puts "Welcome to Toy Robot Simulator. Type your commands below.\nType exit to quit\n"
    puts '============================'
  end

  def read_command
    gets.strip.upcase
  end
end

Main.new.start
