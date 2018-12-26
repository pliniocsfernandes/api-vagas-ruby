class JobOpportunity < ApplicationRecord
  belongs_to :location

  validates_presence_of :title, :description, :location, :level
  validates_associated :location
end
