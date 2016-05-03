class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @product = Product.new
  end

  def derek
    @message = "I'm derek"
  end

  def frank
    @message = "I'm frank"
    redirect_to derek_path
    #render "products/derek"
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

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

  def product_params
    # don't permit user_id, then set it to some review to user_id 5, even it is not your review
    # if you have a form with a drop down, select a product, what comes into your hash is your product id
    # but if your url requires a product id, then you don't need to permit, you can set it from what's from the URL
    product_params = params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def find_product
    @product = Product.find params[:id]
  end



end
