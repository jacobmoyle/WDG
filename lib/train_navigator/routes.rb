module TrainNavigator
  class Routes

    extend Forwardable
    def_delegators :@routes, :<<

    attr_reader :routes
    def initialize routes=[]
      @routes = routes
    end
    
    def max_stops stops
      routes.select { |route| route.stops <= stops }.length
    end

    def max_distance weight
      routes.select { |route| route.weight <= weight }.length
    end

    def exactly stops
      routes.select { |route| route.stops == stops }.length
    end

    def shortest
      dist = routes.sample.weight

      routes.each { |route| dist = route.weight if route.weight < dist}
      
      dist
    end
  end
end