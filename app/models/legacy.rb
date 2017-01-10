class Legacy < ActiveRecord::Base
  belongs_to :user
  enum relationship_status: [ :single, :married ,:married_with_kids ,:single_with_kids]
  enum gender: [ :male, :female]

  accepts_nested_attributes_for :user, reject_if: :all_blank, allow_destroy: true


end
