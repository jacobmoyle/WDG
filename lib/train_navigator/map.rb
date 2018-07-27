module TrainNavigator
  class Map
    
    def initialize tokens
      # TODO: Make Edge class:
      # Edge.weight; Edge.childrens; Edge.name; etc.
      @edges = tokens
    end

    def weight_of nodes
      edges = edges_where(nodes)
      edges.empty? ? nil : get_weight(edges[0])
    end

    def to_hash
      result = {}

      @edges.each do |edge|
        nodes = get_nodes(edge)
        result[nodes[0]] ||= new_edge(nodes[0])
        result[nodes[0]][:children] << nodes[1]
      end

      result
    end

    private

    def new_edge node
      { name: node, children:  [] }
    end

    def edges_where(token)
      @edges.select { |edge| get_nodes(edge) == token }
    end

    def get_nodes edge
      edge.match(/[A-Z]+/).to_s
    end

    def get_weight edge
      edge.match(/\d/).to_s.to_i
    end

  end
end
