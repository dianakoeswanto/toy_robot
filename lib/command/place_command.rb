# frozen_string_literal: true

require_relative 'base_command'

#
# Represents the Place command to place a robot in a given coordinates and orientation.
# Syntax: PLACE x,y,f
#
class PlaceCommand < BaseCommand
  VALID_ORIENTATIONS = %w[NORTH EAST SOUTH WEST].freeze
  PLACE = 'PLACE'

  def initialize(x_coord, y_coord, orientation)
    super()
    @x_coord = x_coord.to_i
    @y_coord = y_coord.to_i
    @orientation = orientation.to_sym
  end

  def execute(robot)
    robot.place(@x_coord, @y_coord, @orientation)
  end

  def self.from_string(command_str)
    raise ArgumentError, 'Not a valid PLACE command' unless command_str.start_with?(PLACE)

    args = command_str.delete_prefix(PLACE).split(',').map(&:strip)
    validate_args(args)
    new(args[0], args[1], args[2])
  end

  def self.validate_args(args)
    raise ArgumentError, 'PLACE command requires three comma separated arguments' if args.length != 3

    x_coord, y_coord, orientation = args
    if Integer(x_coord, exception: false).nil? || Integer(y_coord, exception: false).nil?
      raise ArgumentError, 'PLACE command requires the first two arguments to be numbers'
    end

    return if PlaceCommand::VALID_ORIENTATIONS.include?(orientation)

    raise ArgumentError, "PLACE command requires the last argument to be either #{PlaceCommand::VALID_ORIENTATIONS}"
  end
end
