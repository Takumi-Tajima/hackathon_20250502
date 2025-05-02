class Admins::MealKetsController < Admins::ApplicationController
  before_action :set_meal_ket, only: %i[show edit update destroy]

  def index
    @meal_kets = MealKet.default_order
  end

  def show
  end

  def new
    @meal_ket = MealKet.new
  end

  def edit
  end

  def create
    @meal_ket = MealKet.new(meal_ket_params)

    if @meal_ket.save
      redirect_to admins_meal_ket_path(@meal_ket), notice: 'ミールキットが正常に作成されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @meal_ket.update(meal_ket_params)
      redirect_to admins_meal_ket_path(@meal_ket), notice: 'ミールキットが正常に更新されました', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meal_ket.destroy!
    redirect_to meal_kets_path, notice: 'ミールキットが正常に削除されました', status: :see_other
  end

  private

  def set_meal_ket
    @meal_ket = MealKet.find(params.expect(:id))
  end

  def meal_ket_params
    params.expect(meal_ket: %i[name description price is_frozen published])
  end
end
