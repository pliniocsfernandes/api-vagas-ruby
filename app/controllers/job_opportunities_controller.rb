class JobOpportunitiesController < ApplicationController
  def index
    @job_opportunities = JobOpportunity.all
    render json: @job_opportunities
  end
end
