module TrainNavigator
  class Map
    
    def initialize tokens
      @edges = tokens
    end

    def weight_of nodes
      edges = edges_where(nodes)
      get_weight(edges[0])
    end

    private

    def edges_where(token)
      @edges.select { |edge| nodes_of(edge) == token }
    end

    def nodes_of edge
      edge.match(/[A-Z]+/).to_s
    end

    def get_weight edge
      edge.match(/\d/).to_s.to_i
    end

  end
end
