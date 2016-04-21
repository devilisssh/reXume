class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :degree
      t.integer :year_of_graduation
      t.string :university
      t.references :resume_datum

      t.timestamps null: false
    end
  end
end
