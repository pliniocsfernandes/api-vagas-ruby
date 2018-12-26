require 'rails_helper'

RSpec.describe "JobApplications", type: :request do
  let(:url) { v1_job_applications_path }

  describe 'POST /candidaturas' do


    context 'when the request is valid' do
      let!(:location) { create(:location, name: 'A') }
      let!(:job_opportunity) { create(:job_opportunity, location: location) }
      let!(:person) { create(:person, location: location) }
      let(:valid_attributes) {
        {
            id_vaga: job_opportunity.id,
            id_pessoa: person.id,
        }
      }

      it 'returns status code 201' do
        post url, params: valid_attributes
        expect(response).to have_http_status(201)
      end

      it 'returns created entity with id' do
        post url, params: valid_attributes
        expect(response).to match_json_schema('job_application', strict:true)
      end
    end

    context 'when the request is invalid' do
      before { post url, params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Job opportunity must exist, Job opportunity can't be blank, Person must exist, Person can't be blank/)
      end
    end
  end
end
