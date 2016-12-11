class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comments
      t.references :book

      t.timestamps null: false
    end
  end
end
