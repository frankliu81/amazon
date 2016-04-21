require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:product) { FactoryGirl.create(:product) }
  let(:user) { FactoryGirl.create(:user) }

  describe "#create" do

    context "without a signed in user" do
      # request is the request object that rspec uses to interact
      # with the controller
      it "requires user to be signed in before
      creating a review or they will be directed" do
        get :new, product_id: product.id
        expect(response).to redirect_to new_session_path
      end

    end

    context "with a signed in user" do
      # request is the request object that rspec uses to interact
      # with the controller
      before { request.session[:user_id] = user.id}

      def valid_params
        post :create, product_id: product.id, review: FactoryGirl.attributes_for(:review).merge({user_id: user.id})
      end

      def invalid_params
        post :create, product_id: product.id, review: FactoryGirl.attributes_for(:review).merge({user_id: user.id, body: nil})
      end

      context "valid params" do

        it "associate the review with the current user" do
          valid_params
          expect(Review.last.user.id).to eq(user.id)
        end

      end

      context "invalid params" do
          it "displays the product show page" do
            invalid_params
            expect(response).to render_template("products/show")
          end
      end

    end


  end

end
