# string_calculator_spec.rb
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  it "returns 0 for an empty string" do
    calculator = StringCalculator.new
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number for a single number" do
    calculator = StringCalculator.new
    expect(calculator.add("1")).to eq(1)
  end

  it "returns the sum of two numbers separated by a comma" do
    calculator = StringCalculator.new
    expect(calculator.add("1,2")).to eq(3)
  end

  it "handles new lines between numbers" do
    calculator = StringCalculator.new
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports a custom delimiter" do
    calculator = StringCalculator.new
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "throws an exception for negative numbers" do
    calculator = StringCalculator.new
    expect { calculator.add("1,-2") }.to raise_error("negatives not allowed: -2")
  end

  it "throws an exception for multiple negative numbers" do
    calculator = StringCalculator.new
    expect { calculator.add("1,-2,-3") }.to raise_error("negatives not allowed: -2, -3")
  end

  it "ignores numbers greater than 1000" do
    calculator = StringCalculator.new
    expect(calculator.add("2,1001")).to eq(2)
  end

  it "supports delimiters of any length" do
    calculator = StringCalculator.new
    expect(calculator.add("//[***]\n1***2***3")).to eq(6)
  end

  it "supports multiple delimiters" do
    calculator = StringCalculator.new
    expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
  end
end
