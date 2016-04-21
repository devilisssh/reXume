class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :proficiency
      t.integer :duration
      t.references :resume_datum

      t.timestamps null: false
    end
  end
end
