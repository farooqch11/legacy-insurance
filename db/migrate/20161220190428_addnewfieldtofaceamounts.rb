class Addnewfieldtofaceamounts < ActiveRecord::Migration
  def change
    add_column :faceamounts, :prefered_insurance, :string
  end
end
