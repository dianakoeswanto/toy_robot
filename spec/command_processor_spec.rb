# frozen_string_literal: true

require "spec_helper"
require "command_processor"
require "model/robot"

RSpec.describe CommandProcessor do
  subject { CommandProcessor.new(Robot.new) }

  before { $stdout = StringIO.new}

  describe '#process' do
    context 'given invalid command' do
      it 'should request for a valid command' do
        subject.process('HELLO')
        expect($stdout.string).to eq("Please enter a valid command\n")
      end
    end

    context 'given an invalid place command' do
      it 'should print out error message gracefully' do
        subject.process('PLACE a,b,NORTH')
        expect($stdout.string).to eq("PLACE command requires the first two arguments to be numbers\n")
      end
    end

    it 'should process sequence of command correctly' do
      robot = Robot.new

      commands = ["PLACE 0,0,NORTH", "MOVE", "MOVE", "MOVE", "MOVE", "MOVE", "RIGHT", "REPORT"]
      expected_output = [0,4,'EAST']
      run_commands_and_check_output(robot, commands, expected_output)

      commands = ["MOVE", "MOVE", "MOVE", "MOVE", "MOVE", "REPORT"]
      next_expected_output = [4,4,'EAST']
      run_commands_and_check_output(robot, commands, next_expected_output)

      commands = ["LEFT", "LEFT", "LEFT", "MOVE", "REPORT"]
      next_expected_output = [4,3,'SOUTH']
      run_commands_and_check_output(robot, commands, next_expected_output)
    end
  end

  def run_commands_and_check_output(robot, input_commands, expected_output)
    input_commands.each { |input_command| subject.process(input_command) }
    expect($stdout.string.split("\n").last).to eq("Output: #{expected_output.join(',')}")
  end
end