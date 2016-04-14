class ProductAddSalePrice < ActiveRecord::Migration
  def change
    # table products is plural
    add_column  :products, :sale_price, :float #, default: 0, null: false
  end
end
