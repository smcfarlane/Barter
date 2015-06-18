class SkillsController < ApplicationController
  respond_to :html, :js

  def add_skill_to_user
    @skill = Skill.find(params[:name])
    @details = params[:details]
    @skills_user = SkillsUser.create(user_id: current_user.id, skill_id: @skill.id, details: @details ) unless @skill.users.exists?
    redirect_to skill_path(current_user)
  end

  def new
    @skills = Skill.all
    @skills_user = SkillsUser.new
  end

  def index
    @skills_users = current_user.skills_users
  end

  def show
    current_user.skills_users.find(params[:id])
  end

  def delete
    @skills_user = current_user.skills_users.find(params[:skill_id])
  end

  def destroy
    @skill = params[:id]
    current_user.skills_users.destroy(@skill)
    @skills_users = current_user.skills_users
  end


  def edit
    @skills = Skill.all
    @skills_user = SkillsUser.find(params[:id])
  end

  def update
    @skills_user = SkillsUser.find(user_id: current_user.id, skill_id: @skill.id, details: @details )
    redirect_to skills_path
  end
  private

  def skill_params
    params.permit(:details)
  end
end
