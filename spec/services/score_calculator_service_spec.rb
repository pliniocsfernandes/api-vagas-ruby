require 'rails_helper'

RSpec.describe ScoreCalculatorService, type: :service do
  context '' do
    let(:data_provider) {
      [
          [1, 1, 100],
          [1, 2, 87],
          [1, 3, 75],
          [1, 4, 62],
          [1, 5, 50],
          [2, 1, 87],
          [2, 2, 100],
          [2, 3, 87],
          [2, 4, 75],
          [2, 5, 62],
          [3, 1, 75],
          [3, 2, 87],
          [3, 3, 100],
          [3, 4, 87],
          [3, 5, 75],
          [4, 1, 62],
          [4, 2, 75],
          [4, 3, 87],
          [4, 4, 100],
          [4, 5, 87],
          [5, 1, 50],
          [5, 2, 62],
          [5, 3, 75],
          [5, 4, 87],
          [5, 5, 100],
      ]
    }

    it 'should return the right score for the same location (D = 100)' do
      data_provider.each { |data|
        location = create(:location)
        job_application = create(
            :job_application,
            person: create(:person, location: location, level: data[0]),
            job_opportunity: create(:job_opportunity, location: location, level: data[1])
        )
        score = ScoreCalculatorService.new(job_application).calculate_score
        expect(score).to eq(data[2]), "Expected the score #{data[2]} for NC: #{data[0]} and NV: #{data[1]}, got #{score}"
      }
    end
  end
end