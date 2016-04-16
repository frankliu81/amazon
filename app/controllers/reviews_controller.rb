class ReviewsController < ApplicationController

    before_action :authenticate_user!

    def create
      @product = Product.find params[:product_id]
      review_params = params.require(:review).permit(:star_count, :body)
      @review = Review.new review_params

      # this would assigns the product_id for review
      @review.product = @product
      @review.user = current_user

      if @review.save
        # redirect to product show
        redirect_to product_path(@product), notice: "Thanks for the review"
      else
        flash[:alert] = "Review is not saved"
        render "products/show"
      end

    end

    def destroy
      product = Product.find params[:product_id]
      review = Review.find params[:id]
      review.destroy
      redirect_to product_path(product), notice: "Review deleted"
    end

end
