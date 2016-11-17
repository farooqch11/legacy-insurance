class PopulateRateGuides < ActiveRecord::Migration
  require 'roo'
  def change
    ex = Roo::Excelx.new("public/rate-guide-rails.xlsx")
    ex.default_sheet = ex.sheets[0]              #Mention the sheet number (0 is the first sheet, 1 is second sheet, etc.)
    2.upto(289) do | line |                              #Start and end of rows you want to include
      db_column1 = ex.cell(line,'A')                   #Column A in spreadsheet
      db_column2 = ex.cell(line,'B')
      db_column3 = ex.cell(line,'C')
      db_column4 = ex.cell(line,'D')

       Pricing.create(:age => db_column1, :pns => db_column2, :sns => db_column3, :rate_type=>db_column4)

    end
  end
end
