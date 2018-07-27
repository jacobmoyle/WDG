module TrainNavigator
  module Search

    def self.max_stops map, start, goal, stops
      where(map, start, goal).select { |route| 
        route.length <= stops  
      }.length
    end

    def self.exactly map, start, goal, stops
      where(map, start, goal).select { |route| 
        route.length == stops  
      }.length
    end
    
    private

    ROUTE_LIMIT = 30 # Cuts off inifinite route length, e.g. CBCBCBCBCB....

    def self.depth_first(node, goal, graph, route='', &proc)
      proc.call(route) if node[:name] == goal[:name] && route.length > 1
      
      unless route.length > ROUTE_LIMIT
        node[:children].each { |child| 
          depth_first(graph[child], goal, graph, route + child, &proc)
        }
      end
    end

    def self.where map, start, goal
      graph = map.to_hash
      routes = []

      depth_first(graph[start], graph[goal], graph)  do |route| 
        routes << route
      end

      routes
    end
    
  end
end