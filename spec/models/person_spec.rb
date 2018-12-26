require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should belong_to(:location) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:profession) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:level) }
end
