# frozen_string_literal: true

require "spec_helper"
require "model/robot"

RSpec.shared_examples 'no action' do
  it 'should do nothing' do
    expect(subject.x_coord).to be_nil
    expect(subject.y_coord).to be_nil
    expect(subject.orientation).to be_nil
  end
end

RSpec.describe Robot, type: :model do
  describe '#place' do
    subject { Robot.new }

    context 'when given coordinates that are within boundary and an orientation' do
      it 'should place robot correctly' do
        subject.place(3, 4, :SOUTH)

        expect(subject.placed?).to be(true)
        expect(subject.x_coord).to eq(3)
        expect(subject.y_coord).to eq(4)
        expect(subject.orientation).to eq(:south)
      end
    end

    context 'when given an out-of-bounds coordinates' do
      before { subject.place(-1, 1, :WEST) }

      it_behaves_like 'no action'
    end
  end

  describe '#left' do
    context 'when robot has not been placed' do
      it_behaves_like 'no action'
    end

    it 'should become west when robot is currently facing north' do
      subject.place(3, 1, :NORTH)
      subject.left
      expect(subject.orientation).to eq(:west)
    end
    
    it 'should become north when robot is currently facing east' do
      subject.place(3, 1, :EAST)
      subject.left
      expect(subject.orientation).to eq(:north)
    end
    
    it 'should become east when robot is currently facing south' do
      subject.place(3, 1, :SOUTH)
      subject.left
      expect(subject.orientation).to eq(:east)
    end

    it 'should become south when robot is currently facing west' do
      subject.place(3, 1, :WEST)
      subject.left
      expect(subject.orientation).to eq(:south)
    end
  end

  describe '#right' do
    context 'when robot has not been placed' do
      it_behaves_like 'no action'
    end
    
    it 'should become east when robot is currently facing north' do
      subject.place(3, 1, :NORTH)
      subject.right
      expect(subject.orientation).to eq(:east)
    end
    
    it 'should become south when robot is currently facing east' do
      subject.place(3, 1, :EAST)
      subject.right
      expect(subject.orientation).to eq(:south)
    end
    
    it 'should become west when robot is currently facing south' do
      subject.place(3, 1, :SOUTH)
      subject.right
      expect(subject.orientation).to eq(:west)
    end

    it 'should become north when robot is currently facing west' do
      subject.place(3, 1, :WEST)
      subject.right
      expect(subject.orientation).to eq(:north)
    end
  end

  describe '#move' do
    context 'when robot has not been placed' do
      it_behaves_like 'no action'
    end    

    context 'when facing north' do
      it 'should move one unit towards north' do
        subject.place(3, 1, :NORTH)
        subject.move
        expect(subject.x_coord).to eq(3)
        expect(subject.y_coord).to eq(2)
        expect(subject.orientation).to eq(:north)
      end

      context 'and robot is on the edge of the table' do
        it 'should not move' do
          subject.place(3, 4, :NORTH)
          subject.move
          expect(subject.x_coord).to eq(3)
          expect(subject.y_coord).to eq(4)
          expect(subject.orientation).to eq(:north)
        end
      end
    end

    context 'when facing east' do
      it 'should move one unit towards east' do
        subject.place(2, 1, :EAST)
        subject.move
        expect(subject.x_coord).to eq(3)
        expect(subject.y_coord).to eq(1)
        expect(subject.orientation).to eq(:east)
      end

      context 'and robot is on the edge of the table' do
        it 'should not move' do
          subject.place(4, 1, :EAST)
          subject.move
          expect(subject.x_coord).to eq(4)
          expect(subject.y_coord).to eq(1)
          expect(subject.orientation).to eq(:east)
        end
      end
    end

    context 'when facing south' do
      it 'should move one unit towards south' do
        subject.place(3, 1, :SOUTH)
        subject.move
        expect(subject.x_coord).to eq(3)
        expect(subject.y_coord).to eq(0)
        expect(subject.orientation).to eq(:south)
      end

      context 'and robot is on the edge of the table' do
        it 'should not move' do
          subject.place(3, 0, :SOUTH)
          subject.move
          expect(subject.x_coord).to eq(3)
          expect(subject.y_coord).to eq(0)
          expect(subject.orientation).to eq(:south)
        end
      end
    end

    context 'when facing west' do
      it 'should move one unit towards west' do
        subject.place(3, 1, :WEST)
        subject.move
        expect(subject.x_coord).to eq(2)
        expect(subject.y_coord).to eq(1)
        expect(subject.orientation).to eq(:west)
      end

      context 'and robot is on the edge of the table' do
        it 'should not move' do
          subject.place(0, 1, :WEST)
          subject.move
          expect(subject.x_coord).to eq(0)
          expect(subject.y_coord).to eq(1)
          expect(subject.orientation).to eq(:west)
        end
      end
    end
  end

  describe '#placed?' do
    context 'when robot has been placed' do
      it 'should return true' do
        subject.place(0, 1, :WEST)
        expect(subject.placed?).to be(true)
      end
    end

    context 'when robot has not been placed' do
      it 'should return false' do
        expect(subject.placed?).to be(false)
      end
    end
  end
end
