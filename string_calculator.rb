class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    sanitized_numbers = numbers.gsub("\\n", "\n")
    sanitized_numbers.split(/,|\n/).map(&:to_i).sum
  end
end