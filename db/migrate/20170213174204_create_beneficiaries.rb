class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.date :dob
      t.string :relation
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
