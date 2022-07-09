class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :store_id
      t.string :title
      t.string :body
      t.string :star
      
      t.timestamps
    end
  end
end
