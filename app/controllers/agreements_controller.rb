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
    @agreement = Agreement.create(
        status: 'pending',
        user_id: params[:agreement][:user2],
        board_id: params[:agreement][:board],
        details: params[:agreement][:details],
        user1skill: params[:agreement][:user1skill],
        user2skill: params[:agreement][:user2skill],
        due_date: Date.new(params[:agreement][:due_date][:year].to_i, params[:agreement][:due_date][:month].to_i, params[:agreement][:due_date][:day].to_i)
    )
    if @agreement.save
      redirect_to action: profile_path
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

  def update
    @agreement = Agreement.find(params[:id])
    unless @agreement.user1_agrees && @agreement.user2_agrees
      @agreement.details = params[:agreement][:details]
      @agreement.user1skill = params[:agreement][:user1skill]
      @agreement.user2skill = params[:agreement][:user2skill]
      @agreement.due_date = Date.new(params[:agreement][:due_date][:year].to_i, params[:agreement][:due_date][:month].to_i, params[:agreement][:due_date][:day].to_i)
      if @agreement.changed?
        @agreement.user1_agrees = false
        @agreement.user2_agrees = false
      end
      if params[:submit] == 'Agree'
        if current_user == @agreement.board.user
          @agreement.user1_agrees = true
        elsif current_user == @agreement.user
          @agreement.user2_agrees = true
        end
      end
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

end
