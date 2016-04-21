class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addressable_type
      t.integer :addressable_id
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
