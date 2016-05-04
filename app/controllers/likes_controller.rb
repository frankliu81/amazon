class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :review # this will call the question method to force
                          # finding a question as we will need it for both
                          # the create and destroy actions

  def create
    like = Like.new
    # associate the user and product with the favorite
    like.user = current_user
    like.review = review
    #byebug

    respond_to do |format|
      if like.save
        format.html { redirect_to product_path(review.product), notice: "Liked!" }
        # render looks for which partial to be rendering, then the parameters
        # the locals is necessary when you are rendering views, or
        # you are rendering partial with the partial: key
        format.js { render "create", locals: {review: review} } # likes/create.js.erb
        # tried the below, but it won't work without locals, review will be nil
        #format.js { render "create", review: review }
      else
        format.html { redirect_to product_path(review.product), alert: "You have already liked!" }
        format.js { render js: "alert)'Can\'t like, please refresh the page!');" }
      end
    end
  end

  def destroy
    like.destroy
    respond_to do |format|
      format.html { redirect_to product_path(like.review.product), notice: "Unliked!" }
      format.js { render "destroy", locals: {review: review} }
      # tried the below, but it won't work without locals, review will be nil
      # format.js { render "destroy", review: review }
    end
  end

  private

  def review
    @review ||= Review.find params[:review_id]
  end

  def like
    @like ||= Like.find params[:id]
  end

end
