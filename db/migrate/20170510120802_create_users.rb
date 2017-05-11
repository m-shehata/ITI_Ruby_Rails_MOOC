class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :date_of_birth
      t.string :gender
      t.string :role, :default=>"Student"
      t.string :attachment

      t.timestamps null: false
    end
  end
end
