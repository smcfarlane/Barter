class SkillsController < ApplicationController
  respond_to :html, :js

  def create
  end

  def add_skill_to_user
    @skill = Skill.find(params[:name])
    @skill.users << current_user unless @skill.users.exists?
    #TODO add method to add details
    # @skills_user = @skill.skills_users.find(@skill.users)
    redirect_to user_skills_path(current_user)
  end

  def new
    @user = current_user
    @skill = @user.skills.build
    @skills = Skill.all
    @skills_user = SkillsUser.new
  end

  def index
    @user = current_user
    @skills_users = @user.skills_users
  end

  def show
    @user = current_user
    @user.skills_users.find(params[:id])
  end

  def delete
    @user = current_user
    @skills_user = @user.skills_users.find(params[:skill_id])
    @skill_name = @skills_user.skill.name
  end

  def destroy
    @user = current_user
    @skill = params[:id]
    @user.skills_users.destroy(@skill)
    @skills_users = @user.skills_users
  end


  def edit
    @user = current_user
    @skills_users = @user.skills_users
    @skill_id = params[:id]
    @skill_user = @skills_users.find(params[:id])
    @skill = @skill_user.skill
  end

  private

  def skill_params
    params.permit(:name, :details)
  end
end
