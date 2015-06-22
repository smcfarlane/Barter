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
        user_id: params[:user2],
        board_id: params[:board],
        details: params[:details],
        user1skill: params[:offered_skill_id],
        user2skill: params[:received_skill_id],
        due_date: Date.new(params[:due_date][:year].to_i, params[:due_date][:month].to_i, params[:due_date][:day].to_i)
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
      @agreement.update(
          status: 'pending',
          user_id: params[:user2],
          board_id: params[:board],
          details: params[:details],
          user1skill: params[:offered_skill_id],
          user2skill: params[:received_skill_id],
          due_date: Date.new(params[:due_date][:year].to_i, params[:due_date][:month].to_i, params[:due_date][:day].to_i)
      )
      if params[:submit] == 'Agree'
        if current_user == @agreement.board.user
          @agreement.user1_agrees = true
        elsif current_user == @agreement.user
          @agreement.user2_agrees = true
        end
      end
      if @agreement.changed?
        @agreement.user1_agrees = false
        @agreement.user2_agrees = false
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
