# frozen_string_literal: true

require "spec_helper"
require "command/left_command"
require "model/robot"

describe LeftCommand do
  let(:robot) { instance_double(Robot) }

  context '#execute' do
    it 'should turn robot to the left' do
    end
  end

  context 'from_string' do
    it 'should return an instance of LeftCommand when given a valid command' do
    end

    it 'should throw argument exception when command string is not LEFT' do
    end
  end
end
