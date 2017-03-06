class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :responsibilities
      t.text :description
      t.text :tech_used
      t.string :domain
      t.integer :duration
      t.string :title
      t.references :resume

      t.timestamps null: false
    end
  end
end
