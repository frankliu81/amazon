module ControllerHelpers

  # these helpers create a user, and sign the user in
  # we will instead, use let to create a user instance in
  # the test, and use the application_controller.rb's sign_in 
  # def sign_in
  #   user = FactoryGirl.create(:user)
  #   request.session[:user_id] = user.id
  # end
  #
  # def sign_out
  #   request.session[:user_id] = nil
  # end

end
