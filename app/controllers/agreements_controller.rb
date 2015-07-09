class AgreementsController < ApplicationController
  def index
    @agreements = Agreement.where(user: current_user)
  end

  # def show
  #   @agreement = Agreement.find(params[:id])
  #   @user1 = @agreement.board.user
  #   @user2 = @agreement.user
  #   @board = @agreement.board
  # end

  def new
    @agreement = Agreement.new
    @board = Board.find(params[:Board])
    @user1 = @board.user
    @user2 = User.find(params[:user2])
  end

  def create
    @agreement = Agreement.create(get_new_agreement_params)
    if @agreement.save
      redirect_to profile_path
    else
      redirect_to :back
    end
  end

  def edit
    @agreement = Agreement.find(params[:id])
    @board = @agreement.board
    @user1 = @board.user
    @user2 = @agreement.user
    @edit = true
  end

  def agree
    @agreement = Agreement.find(params[:id])
    if current_user == @agreement.board.user
      @agreement.user1_agrees = true
    elsif current_user == @agreement.user
      @agreement.user2_agrees = true
    end
    @agreement.save
    redirect_to profile_path
  end

  def update
    @agreement = Agreement.find(params[:id])
    unless @agreement.user1_agrees && @agreement.user2_agrees
      @agreement.details = params[:agreement][:details]
      @agreement.user1skill = params[:agreement][:user1skill]
      @agreement.user2skill = params[:agreement][:user2skill]
      @agreement.due_date = Date.new(params[:agreement][:due_date][:year].to_i, params[:agreement][:due_date][:month].to_i, params[:agreement][:due_date][:day].to_i)
      @agreement.user1_agrees = false
      @agreement.user2_agrees = false
      if @agreement.save
        redirect_to profile_path
      else
        redirect_to :back
      end
    else
      redirect_to profile_path
    end
  end

  def destroy
    @agreement = Agreement.find(params[:id])
    @agreement.status = 'deleted'
    redirect_to profile_path
  end

  private

  def get_new_agreement_params
    p = params.require(:agreement).permit(:user_id, :board_id, :details, :user1skill, :user2skill, due_date: [:year, :month, :day])
    {status: 'pending',user_id: p[:user_id], board_id: p[:board_id], details: p[:details], user1skill: p[:user1skill], user2skill: p[:user2skill], due_date: Date.new(p[:due_date][:year].to_i, p[:due_date][:month].to_i, p[:due_date][:day].to_i)}
  end

  def get_edit_agreement_params
    params.require(:agreement).permit(:details, :user1skill, :user2skill, due_date: [:year, :month, :day])
    {details: p[:details], user1skill: p[:user1skill], user2skill: p[:user2skill], due_date: Date.new(p[:due_date][:year].to_i, p[:due_date][:month].to_i, p[:due_date][:day].to_i)}
  end

end
