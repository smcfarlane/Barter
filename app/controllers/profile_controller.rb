class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @skills = @user.skills

    # Find agreements as initiator
    initiator = current_user.my_agreements

    # Find agreements as secondary
    secondary = current_user.agreements

    @agreements = initiator + secondary

    # Find boards created
    @boards_created = Board.where("user_id=?", current_user.id)
    # Sort by create date desc (newest board entries first)
    @boards_created.sort{|a,b| b[:created_at] <=> a[:created_at]}

    # Find boards looking for user's skills
    @boards_match =  Board.where(@skills.map {|s| "'#{s.name}' = ANY (skill_needed)"}.join(' OR ') ).limit(10)

    # Sort by create date desc (newest board entries first)
    @boards_match.sort{|a,b| b[:created_at] <=> a[:created_at]}
  end
end
