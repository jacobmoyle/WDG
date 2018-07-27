module TrainNavigator
  class Route

    extend Forwardable
    def_delegators :@nodes, :length

    attr_reader :nodes
    attr_accessor :weight
    def initialize nodes, weight=nil
      @nodes = nodes
      @weight = weight
    end

    def edges
      result = []
      
      nodes.each_with_index do |node, index|
        next if last(index)
        result << edge_where(node, index)
      end

      result
    end

    def stops
      @nodes.length - 1
    end

    private

    def edge_where node, index
      node + nodes[index + 1]
    end

    def last index
      nodes.length - 1 == index
    end
    
  end
end
