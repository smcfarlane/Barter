class BoardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @board = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @thread = @board.message_thread
    @messages = Message.joins(:user_info).select(:text, :user_id, :first_name, :last_name).where(message_thread_id: @thread.id)
    @user = current_user
  end

  def new
    @board = Board.new
    @skills = Skill.all.pluck(:name)
    @user = current_user
  end

  def create
    skills_offered = []
    params.keys.each do |item|
      p item
      if item.include? '::'
        skills_offered << Skill.find(item.split('::')[1].to_i).name if params[item] == 'on'
      end
    end
    @board = Board.create(user_id: current_user.id, skill_needed: [params[:skill_needed]], skills_offered: skills_offered, details: {city: params[:city], email: params[:contact_email]}, needed_by: Date.civil(params[:needed_by][:year].to_i, params[:needed_by][:month].to_i, params[:needed_by][:day].to_i))
    @board.save
    @thread = MessageThread.create(title: "#{current_user.user_info.first_name} Item Discussion")
    @thread.update_attribute :discussable, @board
    redirect_to board_path(@board)
  end

  def edit
    @board = Board.find(params[:id])
    @skills = Skill.all.pluck(:name)
    @user = current_user
  end

  def update
  end

  def destroy
  end
end
