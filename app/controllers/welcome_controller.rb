class WelcomeController < ApplicationController
  include ApplicationHelper
  def index
    @user_list = User.all.limit(10).order('created_at ASC')
    @admin = @user_list.where(admin:true)
    
    redirect_to profile_path if current_user
  end
end
