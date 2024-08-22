# frozen_string_literal: true

require_relative 'table_top'

#
# Class that represents a robot that can move on the table top
#
class Robot
  ORIENTATIONS = %i[north east south west].freeze

  attr_accessor :x_coord, :y_coord, :orientation

  def place(x_coord, y_coord, orientation)
    return unless TableTop.within_boundary?(x_coord, y_coord)

    @x_coord = x_coord
    @y_coord = y_coord
    @orientation = orientation.downcase
  end

  def move
    return unless placed?

    new_x_coord, new_y_coord = @x_coord, @y_coord

    case @orientation
    when :north then new_y_coord += 1
    when :east  then new_x_coord += 1
    when :south then new_y_coord -= 1
    when :west  then new_x_coord -= 1
    end

    place(new_x_coord, new_y_coord, @orientation)
  end

  def left
    return unless placed?

    new_orientation_idx = (ORIENTATIONS.index(@orientation) - 1) % 4
    @orientation = ORIENTATIONS[new_orientation_idx]
  end

  def right
    return unless placed?

    new_orientation_idx = (ORIENTATIONS.index(@orientation) + 1) % 4
    @orientation = ORIENTATIONS[new_orientation_idx]
  end

  def placed?
    !(@x_coord.nil? && @y_coord.nil? && @orientation.nil?)
  end
end
