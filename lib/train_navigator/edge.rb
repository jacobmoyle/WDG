module TrainNavigator
  class Edge
    def initialize token
      @edge = token
    end

    def from
      @edge[0]
    end

    def to
      @edge[1]
    end

    def weight
      @edge[2].to_i
    end

    def nodes
      from + to
    end
    
  end
end