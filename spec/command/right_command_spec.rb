# frozen_string_literal: true

require "spec_helper"
require "command/right_command"
require "model/robot"

describe RightCommand do
  let(:robot) { instance_double(Robot) }

  context '#execute' do
    it 'should turn robot to the right' do
      expect(robot).to receive(:right)

      RightCommand.from_string('RIGHT').execute(robot)
    end
  end

  context 'from_string' do
    it 'should return an instance of RightCommand when given a valid command' do
      command = RightCommand.from_string('RIGHT')
      expect(command).to_not be_nil
    end

    it 'should throw argument exception when command string is not RIGHT' do
      expect { RightCommand.from_string('RIGHT NOW') }.to raise_error(ArgumentError)
    end
  end
end
