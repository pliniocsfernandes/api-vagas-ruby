require 'rails_helper'

RSpec.describe Path, type: :model do
  it { should belong_to(:src) }
  it { should belong_to(:dst) }

  it { should validate_presence_of(:src) }
  it { should validate_presence_of(:dst) }
  it { should validate_presence_of(:distance) }
end
