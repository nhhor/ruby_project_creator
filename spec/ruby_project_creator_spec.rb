require('rspec')
require('ruby_project_creator.rb')

describe('COIN_COUNTER#converter') do

  it("returns the number of quarters") do
    test = COIN_COUNTER.new(51)
    expect(test.converter()).to(eq("2 quarters, 1 penny"))
  end

  it("returns the number of quarters") do
    test = COIN_COUNTER.new(61)
    expect(test.converter()).to(eq("2 quarters, 1 dime, 1 penny"))
  end

  it("returns the number of quarters") do
    test = COIN_COUNTER.new(214)
    expect(test.converter()).to(eq("2 dollars, 1 dime, 4 pennies"))
  end

  it("returns the number of quarters") do
    test = COIN_COUNTER.new(598)
    expect(test.converter()).to(eq("1 fiver, 3 quarters, 2 dimes, 3 pennies"))
  end

end
