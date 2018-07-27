module TrainNavigator
  module Query

    def self.where map, start, goal
      @graph = map.to_hash
      response = TrainNavigator::Routes.new

      depth_first(@graph[start], @graph[goal])  do |nodes| 
        response << new_route(start + nodes, map)
      end

      response
    end
    
    private

    ROUTE_LIMIT = 8 # Cuts off inifinite route length, e.g. CBCBCBCBCB....

    def self.depth_first(node, goal, route='', &proc)
      proc.call(route) if node[:name] == goal[:name] && route.length > 1
      
      unless route.length > ROUTE_LIMIT
        node[:children].each { |child| 
          depth_first(@graph[child], goal, route + child, &proc)
        }
      end
    end

    def self.new_route nodes, map
      route = TrainNavigator::Route.new(nodes.split(''), @graph)
      route.weight = TrainNavigator::Calculate.distance(map, route) if route
      route
    end
    
  end
end