require 'reading_time'

describe "tests for reading_time method" do 
  it "returns 0 minutes if passed an empty string" do 
    expect(reading_time("")).to eq "0 minutes"
  end 
  it "return 1 minute if passed one word" do
    expect(reading_time("one")).to eq "1 minute"
  end
  it 'returns 2 minutes if passed text 400 words long' do
    result = reading_time("one " * 400)
    expect(result).to eq "2 minutes"
  end  
  it 'returns 5 minutes if passed text 950 words long' do
    result = reading_time("one " * 950)
    expect(result).to eq "5 minutes"
  end  
  it 'returns 5 minutes if passed text 1000 words long' do
    result = reading_time("one " * 1000)
    expect(result).to eq "5 minutes"
  end  
end 