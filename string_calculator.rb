# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Check for custom delimiters
    if numbers.start_with?("//")
      delimiter_info, numbers = numbers.split("\n", 2)
      delimiters = delimiter_info[2..-1] # Remove the "//" prefix
      numbers = numbers.split(delimiters).map(&:to_i)
    else
      # Default to handling commas and newlines
      numbers = numbers.split(/[\n,]/).map(&:to_i)
    end

    # Handle negative numbers
    negatives = numbers.select { |num| num < 0 }
    if negatives.any?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end

    numbers.sum
  end
end
