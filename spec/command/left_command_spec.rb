# frozen_string_literal: true

require "spec_helper"
require "command/left_command"
require "model/robot"

describe LeftCommand do
  let(:robot) { instance_double(Robot) }

  context '#execute' do
    it 'should turn robot to the left' do
      expect(robot).to receive(:left)
      LeftCommand.from_string('LEFT').execute(robot)
    end
  end

  context 'from_string' do
    it 'should return an instance of LeftCommand when given a valid command' do
      command = LeftCommand.from_string('LEFT')
      expect(command).to_not be_nil
    end

    it 'should throw argument exception when command string is not LEFT' do
      expect { LeftCommand.from_string('INVALID_COMMAND') }.to raise_error(ArgumentError)
    end
  end
end
