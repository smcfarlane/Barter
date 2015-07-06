class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    skills_search = ''
    boards_search = ''
    users_search = ''

    unless params[:tab].nil?
      case params[:tab]
        when "skills"
          skills_search = params[:search]
        when "boards"
          boards_search = params[:search]
        when "users"
          users_search = params[:search]
      end
    end

    @skills = Skill.search(skills_search).order('name ASC').paginate(page: params[:page], per_page: 5)
    @boards = Board.search(boards_search).paginate(page: params[:page], per_page: 5)
    @users = User.search(users_search).order('email ASC').paginate(page: params[:page], per_page: 5)

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

end
