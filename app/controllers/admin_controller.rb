class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @skills = Skill.all
    @boards = Board.where(status: 'awaiting')
    @users = User.all
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    @user.boards.delete_all
    flash[:primary] = 'You destroyed a user'
    redirect_to admin_index_path(:tab_redirect => params[:tab_redirect])
  end
end
