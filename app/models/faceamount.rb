class Faceamount < ActiveRecord::Base
  scope :single, -> { where(relationship_status: 'single') }
  scope :married, -> { where(relationship_status: 'married') }
  scope :single_with_kids, -> { where(relationship_status: 'single_with_kids') }
  scope :married_with_kids, -> { where(relationship_status: 'married_with_kids') }
  require 'roo'

  def load_data
    ex = Roo::Excelx.new("public/final rate - face amount.xlsx")
    ex.default_sheet = ex.sheets[0]              #Mention the sheet number (0 is the first sheet, 1 is second sheet, etc.)
    2.upto(14) do | line |                              #Start and end of rows you want to include
      db_column1 = ex.cell(line,'A')                   #Column A in spreadsheet
      db_column2 = ex.cell(line,'B')
      db_column3 = ex.cell(line,'C')
      db_column4 = ex.cell(line,'D')

      Faceamount.create(:relationship_status => db_column1, :start_age => db_column2, :end_age => db_column3, :amount=>db_column4)

    end

  end



end
