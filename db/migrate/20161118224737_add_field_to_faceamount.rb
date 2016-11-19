class AddFieldToFaceamount < ActiveRecord::Migration
  def change
    add_column :faceamounts, :coverage_factor, :integer
  end
end
