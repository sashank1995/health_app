class Disease < ActiveRecord::Base
  has_one :treatment, dependent: :destroy
  validates_associated :treatment
  has_and_belongs_to_many :symptoms


  def self.filtering(sid)
    @diseases = Disease.joins(:symptoms).where(symptoms:{id: sid}).uniq
  end

end
