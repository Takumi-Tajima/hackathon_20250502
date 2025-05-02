class Users::OrdersController < Users::ApplicationController
  before_action :set_active_plan, only: %i[new create]

  def index
    @orders = current_user.orders.default_order.includes(:order_items, :meal_kets)
  end

  def show
    @order = current_user.orders.find(params.expect(:id))
  end

  def new
    @order = current_user.orders.build(
      user_plan: @active_plan,
      delivery_date: next_available_delivery_date
    )
    @meal_kets = MealKet.published.order(:name)
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.user_plan = @active_plan

    if @order.save
      redirect_to users_order_path(@order), notice: '注文を受け付けました'
    else
      @meal_kets = MealKet.published.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_active_plan
    @active_plan = current_user.user_plans.active.first
    unless @active_plan
      redirect_to users_delivery_plans_path, alert: '有効な配送プランがありません'
    end
  end

  def next_available_delivery_date
    Date.current.next_day(3) # 最短3日後から配送可能と仮定
  end

  def order_params
    params.require(:order).permit(
      :delivery_date,
      order_items_attributes: %i[meal_ket_id quantity price]
    )
  end
end
