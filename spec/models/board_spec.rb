
require 'rails_helper'

RSpec.describe Board, type: :model do
  describe :valid do

    it 'creates a valid board' do
      skill1, skill2, skill3 = create(:skill, name: 'plumbing'), create(:skill, name: 'IT'), create(:skill, name: 'sewing')
      board = build(:board)
      expect(board).to be_valid
    end

  end

  describe :invalid do

    context 'when skill_needed is nil' do
      let(:board) { build(:board, skill_needed: nil) }
      it 'should be invalid' do
        expect(board).to_not be_valid
      end
    end

    context 'when skills_needed is a string' do
      let(:board) { build(:board, skill_needed: 'plumbing') }
      it 'should be invalid' do
        expect(board).to_not be_valid
      end
    end

    context 'when needed_by is in the past' do
      let(:board) { build(:board, needed_by: 1.week.ago) }
      it 'should be invalid' do
        expect(board).to_not be_valid
      end
    end

  end
end
