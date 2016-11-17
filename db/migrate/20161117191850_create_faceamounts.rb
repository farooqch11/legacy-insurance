class CreateFaceamounts < ActiveRecord::Migration
  def change
    create_table :faceamounts do |t|
      t.string :relationship_status
      t.integer :start_age
      t.integer :end_age
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
