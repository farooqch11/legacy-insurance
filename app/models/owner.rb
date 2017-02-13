class Owner < ActiveRecord::Base
  belongs_to :legacy
  has_many :beneficiaries

  accepts_nested_attributes_for :beneficiaries, reject_if: :all_blank, allow_destroy: true
end
