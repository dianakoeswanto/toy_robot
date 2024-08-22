# frozen_string_literal: true

# Class that represents a robot that can move on the table top
class Robot
  attr_accessor :x_coord, :y_coord, :orientation

  def place(x_coord, y_coord, orientation); end

  def move; end

  def left; end

  def right; end

  def placed?; end
end
