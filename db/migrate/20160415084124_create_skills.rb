class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :kind
      t.text :tools_used
      t.references :resume

      t.timestamps null: false
    end
  end
end
