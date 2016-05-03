module ProductsHelper
  def user_favorite
    @user_favorite ||= @product.favorite_for(current_user)
  end
end
