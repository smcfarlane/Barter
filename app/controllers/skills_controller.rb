class SkillsController < ApplicationController
  respond_to :html, :js

  def create
  end

  def add_skill_to_user
    @skill = Skill.find(params[:name])
    @details = params[:details]
    @skills_user = SkillsUser.create(user_id: current_user.id, skill_id: @skill.id, details: @details ) unless @skill.users.exists?
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
    @skill = Skill.find(params[:id])
    @skills_user = @skill.skills_users.find(@skill.skills_users)
  end

  def update
    @details = params[:details]
    @user = params[:id]
    @skills_user = SkillsUser.find(params[:user_id])
    SkillsUser.update(@skills_user, user_id: @user, details: @details )
    redirect_to user_skills_path(current_user)
  end
  private

  def skill_params
    params.permit(:details)
  end
end
