# Use RSpec to test the following exercise! You may wish to wrap the methods below in a class to help facilitate this.

# First, implement the is_prime? method below. It should accept a number as an argument and return
# true if the number is prime and false if it is not. A prime number is a number that is only
# divisible by itself and the number 1.

# Second, implement the highest_prime_number_under method below. It should accept a number as
# an argument and return the highest prime number under that number. For example, the 
# highest prime number under 10 is 7.

require 'rspec'

class PrimeCalculator
  def is_prime?(number)
    prime = true
    range = number - 1
    (2..range).each do |value|
      prime = false if (number % value) == 0
    end
    prime
  end
  
  def highest_prime_number_under(number)
    prime_ary = []
    (2..number).each do |value|
      if is_prime?(value)
        prime_ary << value
      end
    end
    prime_ary.last
  end
end

RSpec.describe PrimeCalculator do
  describe '#is_prime?' do
    it 'should return true for 37' do
      calc = PrimeCalculator.new
      expect(calc.is_prime?(37)).to eq(true)
    end

    it 'should return false for 100' do
      calc = PrimeCalculator.new
      expect(calc.is_prime?(100)).to eq(false)
    end

    it 'should return false for 99' do
      calc = PrimeCalculator.new
      expect(calc.is_prime?(99)).to eq(false)
    end
  end

  describe '#highest_prime_number_under' do
    it 'should return 37 for 38' do
      calc = PrimeCalculator.new
      expect(calc.highest_prime_number_under(38)).to eq(37)
    end

    it 'should return 97 for 100' do
      calc = PrimeCalculator.new
      expect(calc.highest_prime_number_under(100)).to eq(97)
    end
  end
end
