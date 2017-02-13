class Beneficiary < ActiveRecord::Base
  belongs_to :owner
end
