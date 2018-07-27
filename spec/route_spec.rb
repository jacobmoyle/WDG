RSpec.describe TrainNavigator::Route do

  describe '#new' do

    it 'requires input' do
      route = TrainNavigator::Route.new('foo')
      expect(route.instance_of?(TrainNavigator::Route)).to be true
      expect(lambda { TrainNavigator::Route.new }).to raise_error ArgumentError
    end

  end

  describe '#edges' do
    
    it 'returns a collection' do
      expect(TrainNavigator::Route.new([]).edges.empty?).to be true
    end
    
    it 'return a valid collection' do
      expect(TrainNavigator::Route.new(['A']).edges.empty?).to be true
      expect(TrainNavigator::Route.new(['A', 'B']).edges.empty?).to be false
    end

    it 'returns node pairs' do
      route = TrainNavigator::Route.new(['A', 'B', 'C'])
      node_pairs = ['AB', 'BC']

      expect(route.edges).to eq node_pairs
    end
    
  end

  describe '#stops' do
    
    it 'returns number of steps to end node, excluding the starting node' do
      route = TrainNavigator::Route.new(['A', 'B', 'C'])
      expect(route.stops).to eq 2
    end
  end
  
end