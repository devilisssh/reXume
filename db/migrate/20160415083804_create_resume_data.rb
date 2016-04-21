class CreateResumeData < ActiveRecord::Migration
  def change
    create_table :resume_data do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :summary
      t.references :user

      t.timestamps null: false
    end
  end
end
