# frozen_string_literal: true

# Base class for all commands. Currently only contains execute method
class BaseCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    raise NotImplementedError, 'Child class needs to implement #execute'
  end
end
