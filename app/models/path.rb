class Path < ApplicationRecord
  belongs_to :src, class_name: 'Location'
  belongs_to :dst, class_name: 'Location'
end
