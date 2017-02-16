require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(start_vertex)
  vertices = {
    start_vertex => {
      parent: nil,
      cost: 0
    }
  }
  possible = [start_vertex]
  shortest_paths = {}

  until possible.empty?
    closest = possible.min_by { |vertex| vertices[vertex][:cost] }
    possible.delete(closest)
    shortest_paths[closest] = vertices[closest]
    vertices.delete(closest)

    closest.out_edges.each do |edge|
      neighbor = edge.to_vertex
      new_cost = shortest_paths[closest][:cost] + edge.cost

      if vertices[neighbor].nil? || new_cost < vertices[neighbor][:cost]
        possible << neighbor
        vertices[neighbor] = {
          parent: closest,
          cost: new_cost
        }
      end
    end
  end

  shortest_paths
end
