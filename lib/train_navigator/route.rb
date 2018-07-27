# require 'forwardable'

module TrainNavigator
  class Route

    extend Forwardable
    def_delegators :@nodes, :length

    def initialize tokens
      @nodes = tokens
    end

    def edges
      result = []
      
      @nodes.each_with_index do |node, index|
        next if last(index)
        result << edge_where(node, index)
      end

      result
    end

    private

    def edge_where node, index
      node + @nodes[index + 1]
    end

    def last index
      @nodes.length - 1 == index
    end
    
  end
end
