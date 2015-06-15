class SkillsController < ApplicationController
  respond_to :html, :js

  def create
  end

  def add_skill_to_user
    @skill = Skill.find(params[:name])
    @skill.users << current_user unless @skill.users.exists?
    redirect_to user_skills_path(current_user)
  end

  def new
    @user = current_user
    @skill = @user.skills.build
    @skills = Skill.all
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
    @skills_user = @user.skill_users.find(params[:id])
    @user.skills_users.destroy(@skill)
    redirect_to user_skills_path(current_user)
  end


  def edit
    @user = current_user
    @skills_users = @user.skills_users
    @skill = @skills_users.skill.find(params[:id])
  end

  private

  def skill_params
    params.permit(:name)
  end
end
