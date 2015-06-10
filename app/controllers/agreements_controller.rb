class AgreementsController < ApplicationController
  def index
    @user_skills = SkillsUser.where(:user_id => current_user.id)
    @agreements = Agreement.where(:user1skill_id => @user_skills.first.id)
  end

  def show
    @agreement = Agreement.find(params[:id])
  end

  def new
    @agreement = Agreement.new

    @user2_id = 2     # hardcode for now; user 2 info will come via message board system

    @user1 = current_user
    @user2 = User.find(@user2_id)

    @user1skills = SkillsUser.where(:user_id => current_user.id)
    @user2skills = SkillsUser.where(:user_id => @user2_id)
  end

  def create
    @agreement = Agreement.create!(
        status: params[:status],
        details: params[:details],
        user1skill_id: params[:offered_skill_id],
        user2skill_id: params[:received_skill_id],
        due_date: params[:due_date]
    )

    redirect_to action: :show, id: @agreement.id
  end

  def edit
    @agreement = Agreement.find(params[:id])

    @user1 = current_user
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
