class Pricing < ActiveRecord::Base
  scope :male249, -> { where(rate_type: 'male249') }
  scope :female249, -> { where(rate_type: 'female249') }
  scope :male499, -> { where(rate_type: 'male499') }
  scope :female499, -> { where(rate_type: 'female499') }
  scope :male2m, -> { where(rate_type: 'male2m') }
  scope :female2m, -> { where(rate_type: 'female2m') }
end
