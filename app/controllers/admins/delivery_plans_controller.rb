module Admins
  class DeliveryPlansController < Admins::ApplicationController
    before_action :set_delivery_plan, only: %i[show edit update destroy]

    def index
      @delivery_plans = DeliveryPlan.default_order
    end

    def show
    end

    def new
      @delivery_plan = DeliveryPlan.new
    end

    def edit
    end

    def create
      @delivery_plan = DeliveryPlan.new(delivery_plan_params)

      if @delivery_plan.save
        redirect_to admins_delivery_plan_path(@delivery_plan), notice: '配送プランを作成しました'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @delivery_plan.update(delivery_plan_params)
        redirect_to admins_delivery_plan_path(@delivery_plan), notice: '配送プランを更新しました'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @delivery_plan.destroy!
      redirect_to admins_delivery_plans_path, notice: '配送プランを削除しました', status: :see_other
    end

    private

    def set_delivery_plan
      @delivery_plan = DeliveryPlan.find(params.expect(:id))
    end

    def delivery_plan_params
      params.expect(delivery_plan: %i[name description delivery_frequency price published])
    end
  end
end
