# frozen_string_literal: true

# Base class for all commands. Currently only contains execute method
class BaseCommand
  private_class_method :new

  def execute(robot)
    raise NotImplementedError, 'Child class needs to implement #execute'
  end
end
