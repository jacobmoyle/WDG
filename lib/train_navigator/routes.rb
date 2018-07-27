module TrainNavigator
  class Routes

    extend Forwardable
    def_delegators :@routes, :<<

    attr_reader :routes
    def initialize routes=[]
      @routes = routes
    end
    
    def max stops
      routes.select { |route| route.stops <= stops }.length
    end

    def exactly stops
      routes.select { |route| route.stops == stops }.length
    end

    def shortest
      dist = routes.sample.weight

      routes.each do |route|
        dist = route.weight if route.weight < dist
      end
      
      dist
    end
  end
end