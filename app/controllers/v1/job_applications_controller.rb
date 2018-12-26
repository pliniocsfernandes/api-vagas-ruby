module V1
  class JobApplicationsController < ApplicationController
    def create
      @job_application = JobApplication.create!(job_application_params)
      render json: @job_application, status: :created
    end

    def job_application_params
      p = params.permit([ :id_vaga, :id_pessoa, ])
      # deserialization
      {
          job_opportunity: JobOpportunity.find_by(id: p[:id_vaga]),
          person: Person.find_by(id: p[:id_pessoa]),
      }
    end
  end
end
