class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.integer :genre_id
      t.string :genre_name
      t.string :postcode
      t.string :address
      t.string :name
      t.string :business_hours
      t.string :fixed_holiday
      t.string :menu
      t.string :access

      t.timestamps
    end
  end
end
