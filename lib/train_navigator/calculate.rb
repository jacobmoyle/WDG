module TrainNavigator
  module Calculate

    def self.distance map, route
      # TODO: check invalid route above
      sum = 0

      # TODO: use reduce to remove result count?
      route.edges.each do |edge|
        sum += map.weight_of(edge)
      end

      sum
    end

  end
end
