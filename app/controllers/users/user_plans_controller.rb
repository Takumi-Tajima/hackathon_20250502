class Users::UserPlansController < Users::ApplicationController
  before_action :set_delivery_plan, only: %i[new create]
  before_action :set_user_plan, only: %i[destroy]

  def index
    @user_plans = current_user.user_plans.default_order.includes(:delivery_plan)
  end

  def new
    @user_plan = current_user.user_plans.build(delivery_plan: @delivery_plan)
  end

  def create
    @user_plan = current_user.user_plans.build(delivery_plan: @delivery_plan)

    if @user_plan.save
      redirect_to users_user_plans_path, notice: 'プランの申し込みが完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_plan.update!(status: :canceled)
    redirect_to users_user_plans_path, notice: 'プランをキャンセルしました', status: :see_other
  end

  private

  def set_delivery_plan
    @delivery_plan = DeliveryPlan.published.find(params.expect(:delivery_plan_id))
  end

  def set_user_plan
    @user_plan = current_user.user_plans.find(params.expect(:id))
  end
end
