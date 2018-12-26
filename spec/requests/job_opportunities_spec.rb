require 'rails_helper'

RSpec.describe "JobOpportunities", type: :request do


  describe "GET /vagas" do
    it "works!" do
      get job_opportunities_path
      expect(response).to have_http_status(200)
    end

    it "should match the response schema" do
      create(:job_opportunity, location: create(:location))

      get job_opportunities_path
      expect(response).to match_json_schema('job_opportunities', strict:true)
    end
  end
end
