RSpec.describe TrainNavigator::Map do

  describe '#new' do

    it 'requires input' do
      map = TrainNavigator::Map.new('foo')
      expect(map.instance_of?(TrainNavigator::Map)).to be true
      expect(lambda { TrainNavigator::Map.new }).to raise_error ArgumentError
    end

  end
  
end