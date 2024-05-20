require './string_calculator'

describe 'String Calculator' do

  describe '#initialize' do
    it 'should initialize string numbers' do
      string_calculator = StringCalculator.new('', '1', '1,5')
      
      expect(string_calculator.instance_variable_get(:@numbers)).to eq(['', '1', '1,5'])
    end
  end

  describe '#add' do
    context 'with only positive numbers' do
      it 'should return sum' do
        string_calculator = StringCalculator.new('', '1', '1,5')

        expect(string_calculator.add).to eq('0, 1, 6')
      end
    end
  end
end
