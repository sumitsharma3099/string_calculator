# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Handle new lines and commas between numbers
    numbers.split(/[\n,]/).map(&:to_i).sum
  end
end
