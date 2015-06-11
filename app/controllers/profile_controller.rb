class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @skills = @user.skills
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
