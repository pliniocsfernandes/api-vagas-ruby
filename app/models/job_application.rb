class JobApplication < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :person

  validates_presence_of :job_opportunity, :person
  validates_associated :job_opportunity, :person
end
