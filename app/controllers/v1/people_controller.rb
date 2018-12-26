class V1::PeopleController < ApplicationController
  def create
    @person = Person.create!(person_params)
    render json: @person, status: :created
  end

  def person_params
    p = params.permit([
                          :nome,
                          :profissao,
                          :localizacao,
                          :nivel,
                      ])
    # deserialization
    {
        name: p[:nome],
        profession: p[:profissao],
        level: p[:nivel],
        location: Location.find_by(name: p[:localizacao])
    }
  end
end
