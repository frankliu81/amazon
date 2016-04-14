class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:title, :description, :price)
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @review = Review.new
  end

  def index
    @products = Product.all
  end

  def edit
  end

  def update
    product_params = params.require(:product).permit(:title, :description, :price)

    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy

    @product.destroy

    redirect_to products_path
  end

private
  def find_product
    @product = Product.find params[:id]
  end

end
