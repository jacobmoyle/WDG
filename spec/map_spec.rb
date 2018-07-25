RSpec.describe TrainNavigator::Map do

  describe '#new' do
    it 'requires user input' do
      expect(lambda { TrainNavigator::Map.new }).to raise_error ArgumentError
      map = TrainNavigator::Map.new('foo')
      expect(map.instance_of?(TrainNavigator::Map)).to be true
    end
  end
  
end