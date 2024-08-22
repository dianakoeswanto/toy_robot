# frozen_string_literal: true

require "spec_helper"
require "command/right_command"
require "model/robot"

describe RightCommand do
  let(:robot) { instance_double(Robot) }

  context '#execute' do
    it 'should turn robot to the right' do
    end
  end

  context 'from_string' do
    it 'should return an instance of RightCommand when given a valid command' do
    end

    it 'should throw argument exception when command string is not RIGHT' do
    end
  end
end
