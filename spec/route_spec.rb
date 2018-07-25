RSpec.describe TrainNavigator::Route do

  describe '#new' do

    it 'requires input' do
      route = TrainNavigator::Route.new('foo')
      expect(route.instance_of?(TrainNavigator::Route)).to be true
      expect(lambda { TrainNavigator::Route.new }).to raise_error ArgumentError
    end

  end
  
end