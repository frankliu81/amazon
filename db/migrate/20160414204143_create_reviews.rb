class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: true
      t.float :star_count
      t.text :body

      t.timestamps null: false
    end
  end
end
