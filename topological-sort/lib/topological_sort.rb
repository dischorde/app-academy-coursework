require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort_khans(vertices)
  sorted = []
  queue = []
  in_degrees = {}

  vertices.each do |vertex|
    queue.unshift(vertex) if vertex.in_count == 0
    in_degrees[vertex] = vertex.in_count
  end

  until queue.empty?
    current = queue.pop
    sorted << current

    current.out_edges.each do |edge|
      destination = edge.to_vertex

      in_degrees[destination] -= 1
      queue.unshift(destination) if in_degrees[destination] == 0
    end

  end

  sorted
end


def visit!(vertex, visited, result)
  return if visited.include?(vertex)

  vertex.out_edges.each do |edge|
    visit!(edge.to_vertex, visited, result)
  end

  visited.add(vertex)
  result.unshift(vertex)
end

def topological_sort(vertices)
  sorted = []
  visited = Set.new

  vertices.each { |vertex| visit!(vertex, visited, sorted) }
  sorted
end
