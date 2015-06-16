class AgreementsController < ApplicationController
  def index
    @user_skills = SkillsUser.where(:user_id => current_user.id)
    @agreements = Agreement.where(:user1skill_id => @user_skills.first.id)
  end

  def show
    @agreement = Agreement.find(params[:id])
    @user1 = @agreement.board.user
    @user2 = @agreement.user
    @board = @agreement.board
  end

  def new
    @agreement = Agreement.new

    @user2_id = params[:user2]
    @board = Board.find(params[:Board])
    @user1 = @board.user
    @user2 = User.find(@user2_id)

    # @user1skills = SkillsUser.where(:user_id => current_user.id)
    # @user2skills = SkillsUser.where(:user_id => @user2_id)
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
      redirect_to action: :show, id: @agreement.id
    else
      redirect_to :back
    end
  end

  def edit
    @agreement = Agreement.find(params[:id])
    @board = @agreement.board
    @user1 = @board.user
    @user2 = @agreement.user

  end

  def update
    @agreement = Agreement.find(params[:id])
    @agreement.update(
        status: 'pending',
        user_id: params[:user2],
        board_id: params[:board],
        details: params[:details],
        user1skill: params[:offered_skill_id],
        user2skill: params[:received_skill_id],
        due_date: Date.new(params[:due_date][:year].to_i, params[:due_date][:month].to_i, params[:due_date][:day].to_i)
    )
    if @agreement.save
      redirect_to action: :show, id: @agreement.id
    else
      redirect_to :back
    end
  end

  def destroy
    @agreement = Agreement.find(params[:id])
    @agreement.status = 'deleted'
    redirect_to action: :index
  end
end
