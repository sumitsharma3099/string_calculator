# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Return the number if only one is provided
    return numbers.to_i if numbers.include?(',')
  end
end
