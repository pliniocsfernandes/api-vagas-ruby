require 'rails_helper'

RSpec.describe "JobOpportunities", type: :request do

  let(:url) { v1_job_opportunities_path }

  describe "GET /vagas" do
    it "works!" do
      get url
      expect(response).to have_http_status(200)
    end

    it "should match the response schema" do
      create(:job_opportunity, location: create(:location))

      get url
      expect(response).to match_json_schema('job_opportunities', strict:true)
    end
  end
end
