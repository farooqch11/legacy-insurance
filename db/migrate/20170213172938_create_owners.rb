class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.date :dob
      t.string :snn
      t.string :adress
      t.string :lisence
      t.date :exp
      t.string :government
      t.string :job_title
      t.float :salary
      t.date :date_of_hire
      t.integer :legacy_id

      t.timestamps null: false
    end

  end
end
