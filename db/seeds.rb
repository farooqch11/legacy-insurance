# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  ex = Roo::Excelx.new("public/final-rate-face-amount-rails.xlsx")
  ex.default_sheet = ex.sheets[0]              #Mention the sheet number (0 is the first sheet, 1 is second sheet, etc.)
  2.upto(17) do | line |                              #Start and end of rows you want to include
    db_column1 = ex.cell(line,'A')                   #Column A in spreadsheet
    db_column2 = ex.cell(line,'B')
    db_column3 = ex.cell(line,'C')
    db_column4 = ex.cell(line,'D')
    db_column5 = ex.cell(line,'E')
    db_column6 = ex.cell(line,'f')

    Faceamount.create(:relationship_status => db_column1, :start_age => db_column2, :end_age => db_column3, :amount=>db_column4,:coverage_factor=>db_column5,:prefered_insurance=>db_column6)

  end

  ex2 = Roo::Excelx.new("public/final-rates-GPM-added.xlsx")
  ex2.default_sheet = ex2.sheets[0]              #Mention the sheet number (0 is the first sheet, 1 is second sheet, etc.)
  2.upto(385) do | line |                              #Start and end of rows you want to include
    db_column1 = ex2.cell(line,'A')                   #Column A in spreadsheet
    db_column2 = ex2.cell(line,'B')
    db_column3 = ex2.cell(line,'C')
    db_column4 = ex2.cell(line,'D')

    Pricing.create(:age => db_column1, :pns => db_column2, :sns => db_column3, :rate_type=>db_column4)

  end



