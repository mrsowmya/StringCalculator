class StringCalculator
  def initialize(*numbers)
    @numbers = numbers
  end

  def add
    output = []
    negative_numbers = []

    @numbers.each do |num|
      array = num.scan(/-?\d+/).map(&:to_i)
      negative_numbers.concat(array.select { |a| a < 0 })
      array.reject! { |x| x > 1000 }

      next unless negative_numbers.empty?

      output << array.sum
    end

    return "Negative numbers not allowed - #{negative_numbers.join(',')}" unless negative_numbers.empty?

    output.join(", ")
  end
end