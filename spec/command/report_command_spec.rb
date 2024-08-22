# frozen_string_literal: true

require "spec_helper"
require "command/report_command"
require "model/robot"

describe ReportCommand do
  let(:robot) { instance_double(Robot) }

  context '#execute' do
    it 'should print robot position and orientation' do
      expect(robot).to receive(:placed?).and_return(true)
      expect(robot).to receive(:x_coord).and_return(2)
      expect(robot).to receive(:y_coord).and_return(2)
      expect(robot).to receive(:orientation).and_return(:east)
      expect(STDOUT).to receive(:puts).with('Output: 2,2,EAST')

      ReportCommand.from_string('REPORT', robot).execute
    end

    it 'should do nothing when robot has not been placed' do
      expect(robot).to receive(:placed?).and_return(false)

      ReportCommand.from_string('REPORT', robot).execute
    end
  end

  context 'from_string' do
    it 'should return an instance of ReportCommand when given a valid command' do
      command = ReportCommand.from_string('REPORT', robot)
      expect(command).to_not be_nil
    end

    it 'should throw argument exception when command string is not REPORT' do
      expect { ReportCommand.from_string('REPORTING', robot) }.to raise_error(ArgumentError)
    end
  end
end
