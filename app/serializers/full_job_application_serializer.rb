class FullJobApplicationSerializer < ActiveModel::Serializer
  attributes :nome, :profissao, :localizacao, :nivel, :score

  def nome
    object.person.name
  end

  def profissao
    object.person.profession
  end

  def localizacao
    object.person.location.name
  end

  def nivel
    object.person.level
  end

  def score

  end
end
