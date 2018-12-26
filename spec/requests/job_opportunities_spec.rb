require 'rails_helper'

RSpec.describe "JobOpportunities", type: :request do

  let(:url) { v1_job_opportunities_path }

  # describe "GET /vagas" do
  #   it "works!" do
  #     get url
  #     expect(response).to have_http_status(200)
  #   end
  #
  #   it "should match the response schema" do
  #     create(:job_opportunity, location: create(:location))
  #
  #     get url
  #     expect(response).to match_json_schema('job_opportunities', strict:true)
  #   end
  # end

  describe 'POST /vagas' do
    let(:valid_attributes) {
      {
          empresa: 'Teste',
          titulo: 'Vaga teste',
          descricao: 'Criar os mais diferentes tipos de teste',
          localizacao: 'A',
          nivel: 3
      }
    }

    context 'when the request is valid' do
      let!(:location) { create(:location, name: 'A') }
      it 'returns status code 201' do
        post url, params: valid_attributes
        expect(response).to have_http_status(201)
      end

      it 'returns created entity with id' do
        post url, params: valid_attributes
        expect(response).to match_json_schema('job_opportunity', strict:true)
      end
    end

    context 'when the request is invalid' do
      before { post url, params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Location must exist, Location can't be blank, Title can't be blank, Description can't be blank, Level can't be blank/)
      end
    end
  end
end
