class TradesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @category = current_user.categories.find(params[:category_id])
    @trades = fetch_trades(@category)
    @total_amount = calculate_total_amount(@trades)
  end

  def show; end

  def new
    @trade = Trade.new
    @categories = current_user.categories
  end

  def create
    @categories = Category.all
    @trade = Trade.new(trade_params)
    @trade.author = current_user

    if save_trade_with_categories(@trade)
      redirect_to category_trades_path(@trade.categories.first), notice: 'Transaction created successfully'
    else
      @errors = @trade.errors.full_messages
      render 'new'
    end
  end

  private

  def fetch_trades(category)
    category.trades.includes(:categories).order(created_at: :desc)
  end

  def calculate_total_amount(trades)
    trades.sum(:amount)
  end

  def record_not_found
    flash[:alert] = 'Category not found'
    redirect_to categories_path
  end

  def save_trade_with_categories(trade)
    Trade.transaction do
      trade.save!
      trade.valid?
    end
  end

  def trade_params
    params.require(:trade).permit(:name, :amount, category_ids: [])
  end
end
