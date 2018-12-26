require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should have_many(:src_paths) }
  it { should have_many(:dst_paths) }

  it 'must return both src paths and dst paths' do
    location1 = create(:location)
    location2 = create(:location)
    location3 = create(:location)

    path1 = create(:path, src: location1, dst: location2)
    path2 = create(:path, src: location3, dst: location1)
    path3 = create(:path, src: location2, dst: location3)

    expect(location1.paths).to include(path1)
    expect(location1.paths).to include(path2)
    expect(location1.paths).not_to include(path3)
  end
end
