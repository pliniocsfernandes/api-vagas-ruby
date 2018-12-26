class PersonSerializer < ActiveModel::Serializer
  attributes :id
  attribute :name, key: :nome
  attribute :profession, key: :profissao
  attribute :level, key: :nivel
  attribute :location, key: :localizacao

  def location
    object.location.name
  end
end
