class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @skills = @user.skills
    @user_skills = SkillsUser.where(:user_id => current_user.id)

    # Find agreements as initiator
    @boards = Board.where(:user_id => current_user.id)
    @agreements ||= Array.new
    @boards.each do |b|
      a = Agreement.find_by(board_id: b.id)

      unless a.nil?
        @agreements << a
      end
    end

    # Find agreements as secondary
    @agreements_as_2nd = Agreement.where(:user_id => current_user.id)

    # Find boards looking for user's skills
    @boards_match ||= Array.new
    @skills.each do |s|
      b =  Board.where("'#{s.name}' = ANY (skill_needed)")

      unless b.nil?
        @boards_match.concat b
      end
    end
    # Sort by create date desc (newest board entries first)
    @boards = @boards.sort{|a,b| b[:created_at] <=> a[:created_at]}
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
