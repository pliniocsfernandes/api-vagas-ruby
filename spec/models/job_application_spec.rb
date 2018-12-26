require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  it { should belong_to(:job_opportunity) }
  it { should belong_to(:person) }
end
