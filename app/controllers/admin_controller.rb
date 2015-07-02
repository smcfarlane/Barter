class AdminController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_from_admin
  # after_action  :unset_from_admin

  def index
    @skills = Skill.all.paginate(page: params[:page], per_page: 10)
    @boards = Board.where(status: 'awaiting').paginate(page: params[:page], per_page: 10)
    @users = User.all.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.js
      format.html
    end
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    @user.boards.delete_all
    flash[:primary] = 'You destroyed a user'
    redirect_to admin_index_path(:tab_redirect => params[:tab_redirect])
  end

  private

  # def set_from_admin
  #   cookies[:from_admin] = true
  # end
  #
  # def unset_from_admin
  #   cookies.delete :from_admin
  #   cookies.delete :admin_active_tab
  # end
end
