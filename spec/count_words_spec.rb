require 'count_words'

RSpec.describe 'count words method' do
  it "counts number of words in a string" do
    result = count_words('hello you guys')
    expect(result). to eq 3
  end

  it 'counts number of words in a string' do
    result = count_words('I am learning how to use TDD')
    expect(result).to eq 7
  end  
end

