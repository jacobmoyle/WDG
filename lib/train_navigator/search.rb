module TrainNavigator
  module Search

    def self.max_stops map, start, goal, stops
      where(map, start, goal).select { |route| 
        route.length <= stops  
      }.length
    end

    def self.where map, start, goal
      graph = map.to_hash
      routes = []

      find_route(graph[start], graph[goal], graph)  do |route| 
        routes << route
      end

      routes
    end
    
    private

    ROUTE_LIMIT = 20 # Cuts off inifinite route length, e.g. CBCBCBCBCB....

    def self.find_route(node, goal, graph, route='', &proc)
      proc.call(route) if node[:name] == goal[:name] && route.length > 1
      
      unless route.length > ROUTE_LIMIT
        node[:children].each { |child| 
          find_route(graph[child], goal, graph, route + child, &proc)
        }
      end
    end
    
  end
end