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

    context 'with n number of numbers' do
      it 'should return sum' do
        string_calculator = StringCalculator.new('1,2,3,4', '1,5', '1,5,7')

        expect(string_calculator.add).to eq('10, 6, 13')
      end
    end

    context 'with new line character' do
      it 'should return sum' do
        string_calculator = StringCalculator.new('1\n2,3')

        expect(string_calculator.add).to eq('6')
      end
    end

    context 'with different delimiters character' do
      it 'should return sum' do
        string_calculator = StringCalculator.new('//;\n1;2')

        expect(string_calculator.add).to eq('3')
      end
    end
    
    context 'with different delimiters character' do
      it 'should return sum' do
        string_calculator = StringCalculator.new('//;\n1;2')

        expect(string_calculator.add).to eq('3')
      end
    end

    context 'with negative numbers' do
      it 'should return error message' do
        string_calculator = StringCalculator.new('-1', '2,3,-4')

        expect(string_calculator.add).to eq('Negative numbers not allowed - -1,-4')
      end
    end

    context 'Numbers bigger than 1000' do
      it 'should return error message' do
        string_calculator = StringCalculator.new('1001, 2', '1,2')

        expect(string_calculator.add).to eq('2, 3')
      end
    end

    context 'With delimiters length' do
      it 'should return error message' do
        string_calculator = StringCalculator.new('//[***]\n1***2***3')

        expect(string_calculator.add).to eq('6')
      end
    end

    context 'With multiple delimiters length' do
      it 'should return error message' do
        string_calculator = StringCalculator.new('//[*][%]\n1*2%3')

        expect(string_calculator.add).to eq('6')
      end
    end

  end
end
