module V1
  class JobOpportunitiesController < ApplicationController
    def create
      @job_opportunity = JobOpportunity.create!(job_opportunity_params)
      render json: @job_opportunity, status: :created
    end

    def job_opportunity_params
      p = params.permit([
        :descricao,
        :empresa,
        :titulo,
        :nivel,
        :localizacao,
      ])
      # deserialization
      {
          company: p[:empresa],
          description: p[:descricao],
          title: p[:titulo],
          level: p[:nivel],
          location: Location.find_by(name: p[:localizacao])
      }
    end
  end
end
