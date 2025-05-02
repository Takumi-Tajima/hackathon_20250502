class Users::DeliveryPlansController < Users::ApplicationController
  def index
    @delivery_plans = DeliveryPlan.published.default_order
  end

  def show
    @delivery_plan = DeliveryPlan.published.find(params.expect(:id))
  end
end
