# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Check for custom delimiters
    if numbers.start_with?("//")
      delimiter_info, numbers = numbers.split("\n", 2)
      delimiters = extract_delimiters(delimiter_info)
      numbers = split_numbers(numbers, delimiters)
    else
      # Default to handling commas and newlines
      numbers = numbers.split(/[\n,]/).map(&:to_i)
    end

    # Handle negative numbers
    negatives = numbers.select { |num| num < 0 }
    if negatives.any?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end

    # Ignore numbers greater than 1000
    numbers = numbers.select { |num| num <= 1000 }

    numbers.sum
  end

  private

  def split_numbers(numbers, delimiters)
    # Split by the provided delimiters using a regex
    numbers.split(Regexp.union(delimiters)).map(&:to_i)
  end

  def extract_delimiters(delimiter_info)
    # Extract delimiters and return as an array
    if delimiter_info[2] == '['
      delimiters = delimiter_info[2..-1].scan(/\[(.*?)\]/).flatten
    else
      delimiters = [delimiter_info[2]]
    end
    delimiters
  end
end
