class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.text :comment
      t.integer :ratable_id
      t.string :ratable_type

      t.timestamps null: false
    end
  end
end
