module ControllerHelpers

  def sign_in
    user = FactoryGirl.create(:user)
    request.session[:user_id] = user.id
  end

  def sign_out
    request.session[:user_id] = nil
  end

end
