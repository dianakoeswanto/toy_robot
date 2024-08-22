# frozen_string_literal: true

#
# Defines the size of the board and provides validation method to check if two given points are within boundary
#
class TableTop
  X_LENGTH = 5
  Y_LENGTH = 5

  def self.within_boundary?(x_coord, y_coord)
    (0...X_LENGTH).include?(x_coord) && (0...Y_LENGTH).include?(y_coord)
  end
end
