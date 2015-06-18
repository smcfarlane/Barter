class WelcomeController < ApplicationController
  include ApplicationHelper
  def index
    redirect_to profile_index_path if current_user
  end
end
