require 'rails_helper'

RSpec.describe "JobApplications", type: :request do
  let(:url) { v1_job_applications_path }

  let(:location) { create(:location, name: 'A') }
  let(:job_opportunity) { create(:job_opportunity, location: location) }
  let(:person) { create(:person, location: location) }
  let(:valid_attributes) {
    {
        id_vaga: job_opportunity.id,
        id_pessoa: person.id,
    }
  }

  describe 'POST /candidaturas' do
    context 'when the request is valid' do
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

  describe 'GET /vagas/:id/candidaturas/ranking' do
    it 'should list all job applications' do
      job_application = create(:job_application, job_opportunity: job_opportunity, person: person)

      get v1_job_opportunity_candidaturas_ranking_path(job_opportunity)
      expect(response).to match_json_schema('full_job_applications', strict:true)
    end
  end
end
