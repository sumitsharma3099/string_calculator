# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Return the sum of two numbers
    numbers.split(',').map(&:to_i).sum
  end
end
