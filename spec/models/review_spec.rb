require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do

    it "requires a starcount" do
      r = Review.new FactoryGirl.attributes_for(:review).merge({star_count: nil})
      expect(r).to be_invalid
    end

    it "requires a body" do
      r = Review.new FactoryGirl.attributes_for(:review).merge({body: nil})
      expect(r).to be_invalid
    end

    it "starcount must be greater than or equal to 1, lesser value will fail" do
      r = Review.new FactoryGirl.attributes_for(:review).merge({star_count: 0})
      expect(r).to be_invalid
    end

    it "starcount must be greater than or equal to 1, greater value will pass" do
      r = Review.new FactoryGirl.attributes_for(:review).merge({star_count: 1})
      expect(r).to be_valid
    end
    it "starcount must be less than or equal to 5, lesser value will pass" do
      r = Review.new FactoryGirl.attributes_for(:review).merge({star_count: 5})
      expect(r).to be_valid
    end

    it "starcount must be less than or equal to 5, greater value will fail" do
      r = Review.new FactoryGirl.attributes_for(:review).merge({star_count: 6})
      expect(r).to be_invalid
    end

  end
end
