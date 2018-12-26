class Person < ApplicationRecord
  belongs_to :location

  validates_presence_of :name, :profession, :location, :level
  validates_associated :location
end
