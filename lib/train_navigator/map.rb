module TrainNavigator
  class Map
    
    def initialize tokens
      @edges = setup(tokens)
    end

    def weight_of nodes
      edge = edge_where(nodes)
      edge ? edge.weight : nil
    end

    def to_hash
      hash = {}

      @edges.each do |edge|
        hash[edge.from] ||= hashed_edge(edge.from)
        hash[edge.from][:children] << edge.to
      end

      hash
    end

    private

    def setup tokens
      tokens.map { |token| TrainNavigator::Edge.new token }
    end

    def hashed_edge node
      { name: node, children:  [] }
    end

    def edge_where nodes
      @edges.select { |edge| edge.nodes == nodes }.first
    end
  end
end
