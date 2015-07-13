class MessageThreadController < ApplicationController
  before_action :authenticate_user!

  def index
    @threads = MessageThread.where(active: true)
  end

  def show
    @thread = MessageThread.find(params[:id])
  end

  def new
    @thread = MessageThread.new
  end

  def create
    @thread = MessageThread.create!(params[:message_thread])
  end

  def edit
    @thread = MessageThread.find(params[:id])
  end

  def update
    @thread = MessageThread.find(params[:id])
    @thread.update!(params[:message_thread])
  end

  def destroy
    @thread = MessageThread.find(params[:id])
    @thread.active = false
    @thread.save
  end
end
