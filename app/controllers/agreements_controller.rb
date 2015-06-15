class AgreementsController < ApplicationController
  def index
    @user_skills = SkillsUser.where(:user_id => current_user.id)
    @agreements = Agreement.where(:user1skill_id => @user_skills.first.id)
  end

  def show
    @agreement = Agreement.find(params[:id])
    @user1 = @agreement.user1
    @user2 = @agreement.user2
    @board = @agreement.board
  end

  def new
    @agreement = Agreement.new

    @user2_id = params[:user2]     # hardcode for now; user 2 info will come via message board system

    @user1 = current_user
    @user2 = User.find(@user2_id)
    @board = Board.find(params[:Board])
    # @user1skills = SkillsUser.where(:user_id => current_user.id)
    # @user2skills = SkillsUser.where(:user_id => @user2_id)
  end

  def create
    @agreement = Agreement.create(
        status: 'pending',
        user1: current_user.id,
        user2: params[:user2],
        boards_id: params[:board],
        details: params[:details],
        user1skill_id: params[:offered_skill_id],
        user2skill_id: params[:received_skill_id],
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

    @user1 = User.find(@agreement.user1.id)
    @user2 = User.find(@agreement.user2.id)
    @user1skills = SkillsUser.where(:user_id => current_user.id)
    @user2skills = SkillsUser.where(:user_id => @agreement.user2.id)
  end

  def update
    @agreement = Agreement.find(params[:id])
    @agreement.update!(
        status: params[:status],
        details: params[:details],
        user1skill_id: params[:offered_skill_id],
        user2skill_id: params[:received_skill_id],
        due_date: params[:due_date]
    )
    redirect_to action: :show, id: @agreement.id
  end

  def destroy
    @agreement = Agreement.find(params[:id])
    @agreement.destroy!
    redirect_to action: :index
  end
end
