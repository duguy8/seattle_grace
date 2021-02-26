class Hospital < ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def unique_universities
    doctors.select('doctors.university').distinct
  end
end
