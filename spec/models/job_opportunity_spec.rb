require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
  it { should belong_to(:location) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:level) }
end
