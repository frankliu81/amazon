require 'rails_helper'

RSpec.describe Product, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    it "requires a title" do
      p = Product.new
      validation_outcome = p.valid?
      expect(p.errors).to have_key(:title)
    end

    it "requires a price" do
      p = Product.new
      validation_outcome = p.valid?
      expect(p.errors).to have_key(:price)
    end

    it "requires a title that is unique" do
      p = Product.create title: "hello", price: 3
      p1 = Product.new title: "hello",  price: 5
      p1.valid?
      # byebug
      expect(p1.errors).to have_key(:title)
    end

    # sales price
    # this case is not needed after we have the after_initialize setup
    # for the sale_price
    # it "requires a sale price to be present" do
    #   p = Product.new title: "hello", price: 5
    #   p.valid?
    #   expect(p.errors).to have_key(:sale_price)
    # end

    # it "requires a default sale price that is the same as price" do
    #   p = Product.new title: "hello", price: 5
    #   #p.valid? # needed if i did the callback before_validation for setting sale price
    #   expect(p.sale_price).to eq(5)
    # end

    # From Jane:
    it "must have a sale price or set sale price to price if no sale price is given" do
      a = Product.create(title: "Hello", description: "abcdefghijkl", price: 10)
      # -> Set Default
      a.valid?
      # -> No errors
      expect(a.errors).not_to have_key(:sale_price)
      expect(a.sale_price).to eq(10)
    end

    it "must have a sale price less than or equal to price" do
      a = Product.create(title: "Hello", description: "abcdefghijkl", price: 5, sale_price: 10)
      a.valid?
      expect(a.errors).to have_key(:sale_price)
    end
    # End from Jane:

    it "requires a sale_price that is less than or equal to price" do
      p = Product.new title: "hello", price: 5, sale_price: 6
      p.valid?
      expect(p.errors).to have_key(:sale_price)
    end

  end

  describe ".onsale?" do
    it "requires true to be returned if product price > sale_price" do
      p = Product.new title: "hello", price: 5, sale_price: 4
      expect(p.onsale?).to be(true)
    end

    it "requires true to be returned if product price > sale_price" do
      p = Product.new title: "hello", price: 5, sale_price: 5
      expect(p.onsale?).to be(false)
    end

  end
end
