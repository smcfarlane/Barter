class WelcomeController < ApplicationController
  include ApplicationHelper
  def index
    redirect_to profile_path if current_user
  end
end
