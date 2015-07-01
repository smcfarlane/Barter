class BoardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user || nil
    @skills = Skill.all.pluck(:name)
    if params[:skill_needed] && params[:skill_offered]
      @board = Board.where("status = :status and :skill_needed = ANY (skill_needed) or :skill_offered = ANY (skills_offered)", {status: 'awaiting', skill_needed: params[:skill_needed], skill_offered: params[:skill_offered]})
    else
      @board = Board.where(status: 'awaiting')
    end
  end

  def show
    @board = Board.find(params[:id])
    @thread = @board.message_thread
    @messages = Message.joins(:user_info).select(:text, :user_id, :first_name, :last_name, :created_at, 'md5("users"."email")').where(message_thread_id: @thread.id)
    @user_id = current_user.id
    @user_name = current_user.user_info.first_name
  end

  def new
    @board = Board.new
    @skills = Skill.all.pluck(:name)
    @user = current_user
  end

  def create
    skills_offered = []
    params.keys.each do |item|
      if item.include? '::'
        skills_offered << Skill.find(item.split('::')[1].to_i).name if params[item] == 'on'
      end
    end
    @board = Board.create(user_id: current_user.id, skill_needed: [params[:skill_needed]], skills_offered: skills_offered, details: {city: params[:city], email: params[:contact_email]}, needed_by: Date.civil(params[:needed_by][:year].to_i, params[:needed_by][:month].to_i, params[:needed_by][:day].to_i))
    if @board.save
      @thread = MessageThread.create(title: "#{current_user.user_info.first_name} Item Discussion")
      @thread.update_attribute :discussable, @board
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def edit
    @board = Board.find(params[:id])
    @skills = Skill.all.pluck(:name)
    @user = current_user
  end

  def update
    skills_offered = []
    params.keys.each do |item|
      p item
      if item.include? '::'
        skills_offered << Skill.find(item.split('::')[1].to_i).name if params[item] == 'on'
      end
    end
    @board = Board.find(params[:id])
    @board.update(skill_needed: [params[:skill_needed]], skills_offered: skills_offered, details: {city: params[:city], email: params[:contact_email]}, needed_by: Date.civil(params[:needed_by][:year].to_i, params[:needed_by][:month].to_i, params[:needed_by][:day].to_i))
    if @board.save
      unless @board.message_thread
        @thread = MessageThread.create(title: "#{current_user.user_info.first_name} Item Discussion")
        @thread.update_attribute :discussable, @board
      end
    end

    redirect_to board_path(@board)
  end

  def destroy
    @board = Board.find(params[:id])
    @board.status = 'removed'
    if @board.save
      if params[:return_admin]
        flash[:success] = 'You destroyed a board'
        redirect_to admin_index_path(:tab_redirect => params[:tab_redirect])
      else
        redirect_to boards_path
      end
    end
  end
end
