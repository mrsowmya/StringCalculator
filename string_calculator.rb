class StringCalculator

  def initialize(*numbers)
    @numbers = numbers
  end

  def add
    output = []
    @numbers.each do |num|
      array = num.split(/[^0-9]+/).map(&:to_i)
      output << array.sum
    end

    output.join(", ")
  end
  
end