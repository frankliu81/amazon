class ReviewsController < ApplicationController

    before_action :authenticate_user!

    def new
      @review = Review.new
    end

    def create
      @product = Product.find params[:product_id]
      review_params = params.require(:review).permit(:star_count, :body)
      @review = Review.new review_params

      # this would assigns the product_id for review
      @review.product = @product
      @review.user = current_user

      #puts ">>>>>>>>>> @review.inspect #{@review.inspect}"
      #puts ">>>>>>>>>> @review.valid? #{@review.valid?}"
      if @review.save
        # redirect to product show
        redirect_to product_path(@product), notice: "Thanks for the review"
      else
        flash[:alert] = "Review is not saved"
        # lifecycle of a web call, it's about when that lifecycle ends
        # original request comes in, redirect, it s a brand new life cycle
        # render uses the existing lifecycle
        # standard create action, if it saves you redirect somewhere else
        # if it fails to save, you want to show the error, normally you would
        # instantiate a instance variable, @review, if the save fails, there will
        # be error on @review.  If you call redirect, it will go to a new actions
        # all the error on the @review object would be gone due to the new lifecycle
        # the reason we want to render, is to preserve the error

        # render products/show with the @product object that I have found earlier
        # in the lifecycle of the same request
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
