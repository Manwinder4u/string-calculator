require_relative "../string_calculator"

RSpec.describe StringCalculator do
  it "returns 0 for an empty string" do
    expect(StringCalculator.add("")).to eq(0)
  end

  it "returns the number itself if only one number is provided" do
    expect(StringCalculator.add("5")).to eq(5)
  end

  it "returns the sum of two numbers" do
    expect(StringCalculator.add("1,2")).to eq(3)
  end

  it "returns the sum of multiple numbers" do
    expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
  end

  def extract_delimiter(input)
    match = input.match(/^([;,:@#&$%^*(){}\[\]<>|\/\\?!~+=.-]+)/)
    match ? match[1] : nil
  end

  it "extracts semicolon (;)" do
    expect(extract_delimiter(";1;2")).to eq(";")
  end

  it "extracts comma (,)" do
    expect(extract_delimiter(",3,4")).to eq(",")
  end

  it "extracts colon (:)" do
    expect(extract_delimiter(":5:6")).to eq(":")
  end
end
