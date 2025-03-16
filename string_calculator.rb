class StringCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.strip.empty?

    numbers = numbers.to_s.strip
    if numbers.start_with?("//")
      delimiter_section = numbers.split("//")[1].split("\n")[0]
      delimiter = StringCalculator.extract_special_delimiter(delimiter_section)
      puts "Delimiter: #{delimiter}"
    else
      delimiter = ","
    end

    delimiter_regex = Regexp.escape(delimiter)
    numbers_array = numbers.split(/[\n#{delimiter_regex}]/).map(&:to_i)

    negatives = numbers_array.select { |num| num.negative? }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    
    numbers_array.sum
  end

  def self.extract_special_delimiter(delimiter)
    match = delimiter.match(/^([;,:@#&$%^*(){}\[\]<>|\/\\?!~+=.-]+)/)
    match ? match[1] : nil
  end
end