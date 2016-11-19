class Legacy < ActiveRecord::Base
  belongs_to :user
  enum relationship_status: [ :single, :married ,:married_with_kids ,:single_with_kids]
  enum gender: [ :male, :female]

end
