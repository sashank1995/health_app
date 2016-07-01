class Treatment < ActiveRecord::Base
  belongs_to :disease
  #validates :disease_id, presence: true
end
