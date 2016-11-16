class Legacy < ActiveRecord::Base
  belongs_to :user
  enum relationship_status: [ :single, :married ,:married_with_kids ,:single_with_kids,:in_an_relationship]

end
