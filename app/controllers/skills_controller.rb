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

  def kill
    @skills = Skill.all
  end

  def kill_destroy
    @skills_user = SkillsUser.where(skill_id: params[:id]).delete_all
    @skill = Skill.destroy(params[:id])
    if @skill.save
      if params[:return_admin]
        flash[:primary] = 'You destroyed a skill'
        redirect_to admin_index_path(:tab_redirect => params[:tab_redirect])
      else
        redirect_to skills_path
      end
    end   
  end

  def create_new_skill
    @skill = Skill.new
  end

  def create_skill
    @skill = Skill.create(name: params[:name])
    if @skill.save
      if params[:return_admin]
        flash[:primary] = 'You created a new skill'
        redirect_to admin_index_path(:tab_redirect => params[:tab_redirect])
      else
      redirect_to admin_index_path
      end
    end
  end

end
