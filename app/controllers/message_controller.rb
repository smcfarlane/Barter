class MessageController < ApplicationController
  # before_action :authenticate_user!
  respond_to :json

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create!(user_id: current_user.id, message_thread_id: params[:thread_id], text: params[:text])
    # unless Subscriber.where(user_id: current_user.id, message_thread_id: params[:thread_id]) == []
    #   Subscriber.create!(id: 1, user_id: current_user.id, message_thread_id: params[:thread_id])
    # end
    render :json => {message: 'message saved'}
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message = Message.update!(user_id: current_user.id, message_thread_id: params[:thread_id], text: params[:text])
    unless Subscriber.where(user_id: current_user.id, message_thread_id: params[:thread_id]) == []
      Subscriber.create!(id: 1, user_id: current_user.id, message_thread_id: params[:thread_id])
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.active = false
    @message.save
  end
end
