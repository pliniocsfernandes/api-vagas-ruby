require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  it {should belong_to(:job_opportunity)}
  it {should belong_to(:person)}

  describe 'calculate distance between person and job opportunity' do
    let!(:locations) {
      Location.create(
          [
              {'name': 'A'},
              {'name': 'B'},
              {'name': 'C'},
              {'name': 'D'},
              {'name': 'E'},
              {'name': 'F'},
          ]
      )
    }
    let!(:paths) {
      Path.create(
          [
              {'src': locations[Location::D], 'dst': locations[Location::E], 'distance': 10},
              {'src': locations[Location::B], 'dst': locations[Location::C], 'distance': 7},
              {'src': locations[Location::D], 'dst': locations[Location::F], 'distance': 8},
              {'src': locations[Location::C], 'dst': locations[Location::E], 'distance': 4},
              {'src': locations[Location::B], 'dst': locations[Location::D], 'distance': 3},
              {'src': locations[Location::A], 'dst': locations[Location::B], 'distance': 5},
          ])
    }
    let(:data_provider) {
      [
          ['A', 'A', 0],
          ['A', 'B', 5],
          ['A', 'C', 12],
          ['A', 'D', 8],
          ['A', 'E', 16],
          ['A', 'F', 16],
      ]
    }

    it 'should get the shortest path' do
      data_provider.each do |data|
        person = create(:person, location: Location.find_by(name: data[0]))
        job_opportunity = create(:job_opportunity, location: Location.find_by(name: data[1]))
        job_application = create(:job_application, person: person, job_opportunity: job_opportunity)
        distance = job_application.calculate_distance
        expect(distance).to eq(data[2]), "Expected the distance #{data[2]} from #{data[0]} to #{data[1]}, got #{distance}"
      end
    end
  end
end
