require 'rails_helper'

RSpec.describe Board, type: :model do
  describe :valid do
    context 'creates a valid object' do
      it 'is valid' do
        skill1, skill2, skill3 = create(:skill, name: 'plumbing'), create(:skill, name: 'IT'), create(:skill, name: 'sewing')
        board, user = create(:board), create(:user)
        agreement = build(:agreement, board_id: board.id, user_id: user.id)
        expect(agreement).to be_valid
      end
    end
  end

  describe :invalid do

    context 'when user1skill is not a skill' do
      it 'should be invalid' do
        skill1, skill2, skill3 = create(:skill, name: 'plumbing'), create(:skill, name: 'IT'), create(:skill, name: 'sewing')
        board, user = create(:board), create(:user)
        agreement = build(:agreement, board_id: board.id, user_id: user.id, user1skill: 'lksdfj')
        expect(agreement).to_not be_valid
      end
    end

    context 'when due_date is in the past' do
      it 'should be invalid' do
        skill1, skill2, skill3 = create(:skill, name: 'plumbing'), create(:skill, name: 'IT'), create(:skill, name: 'sewing')
        board, user = create(:board), create(:user)
        agreement = build(:agreement, board_id: board.id, user_id: user.id, due_date: 1.week.ago)
        expect(agreement).to_not be_valid
      end
    end

  end
end