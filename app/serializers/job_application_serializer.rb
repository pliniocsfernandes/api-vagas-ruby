class JobApplicationSerializer < ActiveModel::Serializer
  attributes :id
  attribute :person_id, key: :id_pessoa
  attribute :job_opportunity_id, key: :id_vaga
end
