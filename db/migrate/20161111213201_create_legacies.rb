class CreateLegacies < ActiveRecord::Migration
  def change
    create_table :legacies do |t|
      t.integer :age
      t.integer :relationship_status
      t.boolean :smoker
      t.decimal :coverage_amount
      t.decimal :monthly_amount
      t.float   :insurance_years
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
