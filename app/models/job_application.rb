class JobApplication < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :person

  validates_presence_of :job_opportunity, :person
  validates_associated :job_opportunity, :person

  # Calcula o menor caminho entre a Localidade (Location) do candidato e a Localidade (Location) da vaga
  # Implementação baseada no algoritmo de menor caminho de Dijkstra
  # Neste caso o caminho é ignorado e apenas a distância é considerada
  def calculate_distance
    node = person.location
    queue = [node]
    dist = Hash[Location.all.to_a.map { |x| [x.id, Float::INFINITY] }]
    dist[node.id] = 0
    begin
      node = queue.pop
      node.paths.each { |path|
        neighbor = path.get_neighbor_of node
        new_distance = dist[node.id] + path.distance
        if dist[neighbor.id] > new_distance
          dist[neighbor.id] = new_distance
          queue.append neighbor
        end
      }
    end until queue.empty?
    dist[job_opportunity.location.id]
  end
end
