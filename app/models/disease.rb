class Disease < ActiveRecord::Base
  has_one :treatment
  has_and_belongs_to_many :symptoms
end
