# frozen_string_literal: true

require "spec_helper"
require "command/report_command"
require "model/robot"

describe ReportCommand do
  let(:robot) { instance_double(Robot) }

  context '#execute' do
    it 'should print robot position and orientation' do
    end
  end

  context 'from_string' do
    it 'should return an instance of ReportCommand when given a valid command' do
    end

    it 'should throw argument exception when command string is not REPORT' do
    end
  end
end
