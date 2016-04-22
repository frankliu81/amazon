class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = Like.new
    # associate the user and product with the favorite
    like.user = current_user
    like.review = review
    #byebug
    if like.save
      redirect_to product_path(review.product), notice: "Liked!"
    else
      redirect_to product_path(review.product), alert: "You have already liked!"
    end
  end

  def destroy
    like.destroy
    redirect_to product_path(like.review.product), notice: "Unliked!"
  end

  private

  def review
    @review ||= Review.find params[:review_id]
  end

  def like
    @like ||= Like.find params[:id]
  end

end
