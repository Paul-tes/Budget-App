class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  def index
    @title = 'Purchases'
    @category = current_user.categories.find(params[:category_id])
    @purchases = @category.purchases.order(created_at: :desc)
    @purchases_sum = @purchases.sum(:amount)
  end

  def show; end

  def new
    @title = 'New Purchase'
    @category = current_user.categories.find(params[:category_id])
    @purchase = Purchase.new
  end

  def edit; end

  def create
    @category = current_user.categories.find(params[:category_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to category_purchases_path(@category) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchase_url(@purchase), notice: 'Purchase was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :user_id, :category_id)
  end
end
