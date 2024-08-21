# frozen_string_literal: true

require "spec_helper"
require "command/place_command"
require "model/robot"

describe PlaceCommand do
  let(:robot) { instance_double(Robot) }

  context '#execute' do
    it 'should place robot on the table top' do
      expect(robot).to receive(:place).with(0, 0, :NORTH)

      command = PlaceCommand.from_string('PLACE 0,0,NORTH', robot)
      command.execute
    end
  end

  context 'from_string' do
    it 'should return an instance of PlaceCommand' do
      command = PlaceCommand.from_string('PLACE 0,0,NORTH', robot)
      expect(command).to_not be_nil
      expect(command).to be_a(PlaceCommand)
    end

    it 'should throw argument exception when command string does not begin with PLACE' do
      expect { PlaceCommand.from_string('INVALID_COMMAND 0,0,NORTH', robot) }.to raise_error(ArgumentError)
    end

    it 'should throw argument exception when first argument is not a valid integer' do
      expect { PlaceCommand.from_string('PLACE 1.3,0,NORTH', robot) }.to raise_error(ArgumentError)
    end

    it 'should throw argument exception when second argument is not a valid integer' do
      expect { PlaceCommand.from_string('PLACE 1, 0.5, NORTH', robot) }.to raise_error(ArgumentError)
    end

    it 'should throw argument exception when given an invalid orientation' do
      expect { PlaceCommand.from_string('PLACE 0,0,INVALID_ORIENTATION', robot) }.to raise_error(ArgumentError)
    end
  end
end
