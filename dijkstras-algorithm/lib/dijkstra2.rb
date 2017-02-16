require_relative 'graph'
require_relative 'priority_map'

# O(|V| + |E|*log(|V|)).
def dijkstra2(start_vertex)
  possible = PriorityMap.new do |data1, data2|
    data1[:cost] <=> data2[:cost]
  end
  possible[start_vertex] = { cost: 0, parent: nil }
  shortest_paths = {}

  until possible.empty?
    closest, closest_data = possible.extract
    shortest_paths[closest] = closest_data

    closest.out_edges.each do |edge|
      neighbor = edge.to_vertex
      new_cost = closest_data[:cost] + edge.cost

      if possible[neighbor].nil? || new_cost < possible[neighbor][:cost]
        possible[neighbor] = {
          parent: closest,
          cost: new_cost
        }
      end
    end
  end

  shortest_paths
end
