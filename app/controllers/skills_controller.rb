class SkillsController < ApplicationController
  def create
  end

  def add_skill_to_user
    @skill = Skill.find(params[:name])
    @skill.users << current_user unless @skill.users.exists?
    redirect_to profile_index_path
  end

  def new
    @user = current_user
    @skill = @user.skills.build
    @skills = Skill.all
  end

  def index
    @skills = current_user.skills
  end

  private
  def skill_params
    params.permit(:name)
  end
end
