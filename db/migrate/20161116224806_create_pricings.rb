class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :age
      t.decimal  :pns
      t.decimal :sns
      t.string :rate_type

      t.timestamps null: false
    end
  end
end
