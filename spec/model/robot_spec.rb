# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/model/robot'

describe Robot do
  describe '#place' do
    context 'when given valid coordinates and orientation' do
      it 'should place robot correctly' do
      end
    end

    context 'when given invalid orientation' do
      it 'should throw an error when given an invalid orientation' do
      end
    end

    context 'when given an out-of-bounds coordinates' do
      it 'should do nothing' do
      end
    end
  end

  describe '#left' do
    context 'when robot has not been placed' do
      it 'should do nothing' do
        
      end
    end

    context 'when facing north' do
      it 'should become west' do
      end
    end

    context 'when facing east' do
      it 'should become north' do
      end
    end

    context 'when facing south' do
      it 'should become east' do
      end
    end

    context 'when facing west' do
      it 'should become south' do
      end
    end
  end

  describe '#right' do
    context 'when robot has not been placed' do
      it 'should do nothing' do
      end
    end
    
    context 'when facing north' do
      it 'should become east' do
      end
    end

    context 'when facing east' do
      it 'should become south' do
      end
    end

    context 'when facing south' do
      it 'should become west' do
      end
    end

    context 'when facing west' do
      it 'should become north' do
      end
    end
  end

  describe '#move' do
    context 'when robot has not been placed' do
      it 'should do nothing' do
      end
    end    

    context 'when facing north' do
      it 'should move one unit towards north' do
      end

      context 'and robot is on the edge of the table' do
        it 'should not move' do
        end
      end
    end

    context 'when facing east' do
      it 'should move one unit towards east' do
      end

      context 'and robot is on the edge of the table' do
        it 'should not move' do
        end
      end
    end

    context 'when facing south' do
      it 'should move one unit towards south' do
      end

      context 'and robot is on the edge of the table' do
        it 'should not move' do
        end
      end
    end

    context 'when facing west' do
      it 'should move one unit towards west' do
      end

      context 'and robot is on the edge of the table' do
        it 'should not move' do
        end
      end
    end
  end

  describe '#placed?' do
    context 'when robot has been placed' do
      it 'should return true' do
        
      end
    end

    context 'when robot has not been placed' do
      it 'should return false' do
        
      end
    end
  end
end
