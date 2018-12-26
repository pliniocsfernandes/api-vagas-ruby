require 'rails_helper'

RSpec.describe "People", type: :request do
  let(:url) { v1_people_path }

  describe 'POST /pessoas' do
    let(:valid_attributes) {
      {
          nome: 'John Doe',
          profissao: 'Engenheiro de software',
          localizacao: 'C',
          nivel: 2
      }
    }

    context 'when the request is valid' do
      let!(:location) { create(:location, name: 'C') }
      it 'returns status code 201' do
        post url, params: valid_attributes
        expect(response).to have_http_status(201)
      end

      it 'returns created entity with id' do
        post url, params: valid_attributes
        expect(response).to match_json_schema('person', strict:true)
      end
    end

    context 'when the request is invalid' do
      before { post url, params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Location must exist, Location can't be blank, Name can't be blank, Profession can't be blank, Level can't be blank/)
      end
    end
  end
end
