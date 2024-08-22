# frozen_string_literal: true

require "spec_helper"
require "command/move_command"
require "model/robot"

describe MoveCommand do
  let(:robot) { instance_double(Robot) }

  context '#execute' do
    it 'should move robot' do
      expect(robot).to receive(:move)

      command = MoveCommand.from_string('MOVE', robot)
      command.execute
    end
  end

  context 'from_string' do
    it 'should return an instance of MoveCommand when given a valid command' do
      command = MoveCommand.from_string('MOVE', robot)
      expect(command).to_not be_nil
      expect(command).to be_a(MoveCommand)
    end

    it 'should throw argument exception when command string is not MOVE' do
      expect { MoveCommand.from_string('MOVIE', robot) }.to raise_error(ArgumentError)
    end
  end
end
