module ISBN13
  class DigitChecker
    attr_accessor :number

    def initialize(number)
      @number = number
    end

    def calculate
      array_of_digits = number.scan(/\w/)
      sum = array_of_digits.each.with_index.inject(0) {
        | sum, (number, index) | index.odd? ? sum + (number.to_i * 3) : sum + number.to_i
      }
      remainder = 10 - sum.modulo(10)
      number[-1] = remainder.to_s
      number
    end

  end
end

number = ISBN13::DigitChecker.new('978014300723').calculate
puts number
