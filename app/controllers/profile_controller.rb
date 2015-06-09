class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @skills = @user.skills
    @skill = Skill.new
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def add
    @user = current_user
    # @skill = @user.skills.build
    @skills = Skill.all
    # @user.skills <<
    # @user.skills << @skill
    # flash[:notice] = "You have added a skill."
  end


end
