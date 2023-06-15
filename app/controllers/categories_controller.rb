class CategoriesController < ApplicationController
  load_and_authorize_resource

  # Errors handling
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    flash[:error] = 'Category not found.'
    redirect_to root_path
  end

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end

  # categories#index ___ GET /categories
  def index
    @user = current_user
    @categories = @user.categories
  end

  # categories#show ___ GET /categories/:id
  def show
    @category = current_user.categories.includes(:trades).find(params[:id])
    @trades = @category.trades
    @total_amount = calculate_total_amount(@trades)
  end

  # categories#new ___ GET /categories/new
  def new
    @category = Category.new
  end

  # categories#create ___ POST /categories
  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def calculate_total_amount(trades)
    trades.sum(:amount)
  end
end
