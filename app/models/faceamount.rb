class Faceamount < ActiveRecord::Base
  scope :single, -> { where(relationship_status: 'single') }
  scope :married, -> { where(relationship_status: 'married') }
  scope :single_with_kids, -> { where(relationship_status: 'single_with_kids') }
  scope :married_with_kids, -> { where(relationship_status: 'married_with_kids') }



end
