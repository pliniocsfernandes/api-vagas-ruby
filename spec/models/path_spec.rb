require 'rails_helper'

RSpec.describe Path, type: :model do
  it { should belong_to(:src) }
  it { should belong_to(:dst) }
end
