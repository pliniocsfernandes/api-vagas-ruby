class JobOpportunitySerializer < ActiveModel::Serializer
  attribute :company, key: :empresa
  attribute :title, key: :titulo
  attribute :description, key: :descricao
  attribute :location, key: :localizacao
  attribute :level, key: :nivel

  def location
    object.location.name
  end
end
