class WelcomeController < ApplicationController
  include ApplicationHelper
  def index
    @thread = MessageThread.find(1)
    @messages = Message.joins(:user_info).select(:text, :user_id, :first_name, :last_name).where(message_thread_id: @thread.id)
  end
end
