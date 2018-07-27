RSpec.describe TrainNavigator::Edge do
  before :all do
    @edge = TrainNavigator::Edge.new 'AB5'
  end
  
  describe '#weight' do
    it 'returns the weight' do
      expect(@edge.weight).to eq 5
    end
  end

  describe '#from' do
    it 'returns the starting node' do
      expect(@edge.from).to eq 'A'
    end
  end

  describe '#to' do
    it 'returns the next node' do
      expect(@edge.to).to eq 'B'
    end
  end

  describe '#nodes' do
    it 'returns nodes' do
      expect(@edge.nodes).to eq 'AB'
    end
  end
end