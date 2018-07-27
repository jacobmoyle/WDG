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

    def self.shortest map, start, goal, shortest=nil

      where(map, start, goal).each do |route|
        dist = TrainNavigator::Calculate.distance(map, route)
        
        shortest ||= dist

        if dist < shortest
          shortest = dist
        end
      end
      
      shortest
    end
    
    private

    ROUTE_LIMIT = 5 # Cuts off inifinite route length, e.g. CBCBCBCBCB....

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
        routes << TrainNavigator::Route.new(route.split(''))
      end

      routes
    end
    
  end
end