class SkillsController < ApplicationController
  respond_to :html, :js

  def add_skill_to_user
    @skill = Skill.find(params[:name])
    @details = params[:details]

    @skills_user = SkillsUser.create(user_id: current_user.id, skill_id: @skill.id, details: @details )
    redirect_to skills_path(@skills_user.id)
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
    current_user.skills_users.destroy(params[:id])
    @skills_users = current_user.skills_users
  end


  def edit
    @skills = Skill.all
    @skills_user = SkillsUser.find(params[:id])
  end

  def update
    @skills_user = SkillsUser.find(params[:id])
    @skills_user.update(details: params[:details])
    redirect_to skills_path
  end
end
