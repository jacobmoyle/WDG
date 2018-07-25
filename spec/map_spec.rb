RSpec.describe TrainNavigator::Map do

  describe '#new' do

    it 'requires input' do
      map = TrainNavigator::Map.new('foo')
      expect(map.instance_of?(TrainNavigator::Map)).to be true
      expect(lambda { TrainNavigator::Map.new }).to raise_error ArgumentError
    end

  end

  describe '#weight_of' do

    it 'returns a weight' do
      map = TrainNavigator::Map.new(['AB2', 'BC8'])
      expect(map.weight_of('AB')).to eq 2
      expect(map.weight_of('BC')).to eq 8
    end

  end
  
end