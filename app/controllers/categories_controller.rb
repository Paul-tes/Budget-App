class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @title = 'Categories'
    @categories = current_user.categories
  end

  def show; end

  def new
    @title = 'Add a Category'
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
