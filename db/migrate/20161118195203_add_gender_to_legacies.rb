class AddGenderToLegacies < ActiveRecord::Migration
  def change
    add_column :legacies, :gender, :integer
  end
end
