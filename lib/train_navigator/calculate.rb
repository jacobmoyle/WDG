module TrainNavigator
  module Calculate

    def self.distance map, route
      sum = 0
      error = nil

      route.edges.each do |edge|
        weight = map.weight_of(edge)
        weight ? sum += weight : error = 'NO SUCH ROUTE'
      end

      error.nil? ? sum : error
    end

  end
end
