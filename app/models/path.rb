class Path < ApplicationRecord
  belongs_to :src, class_name: 'Location'
  belongs_to :dst, class_name: 'Location'

  validates_presence_of :distance, :src, :dst

  def get_neighbor_of location
    if src == location
      dst
    else
      src
    end
  end
end
