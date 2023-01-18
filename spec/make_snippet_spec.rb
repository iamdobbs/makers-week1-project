require 'make_snippet'

RSpec.describe 'make_snippet method' do
  it 'takes a string and returns first five words followed by "..."' do
    expect(make_snippet("Hello my name is Hayley and I like coding.")).to eq "Hello my name is Hayley..."
  end  
end
