class Location < ApplicationRecord
  A = 0
  B = 1
  C = 2
  D = 3
  E = 4
  F = 5
  has_many :src_paths, class_name: 'Path', foreign_key: 'src_id'
  has_many :dst_paths, class_name: 'Path', foreign_key: 'dst_id'

  validates_presence_of :name

  def paths
    src_paths + dst_paths
  end
end
