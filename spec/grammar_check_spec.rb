require 'grammar_check'

describe 'tests for the grammar check method' do
  context 'when an empty string or does\'t have multiple words' do
    it 'fails' do
      expect {grammar_check("")}.to raise_error "That's not a complete sentence."
    end  
  end

  it 'returns confirmation of a grammatically correct string' do
    expect(grammar_check("The dog was barking.")).to eq "That sentence has correct grammar."
  end 

  context 'when a string either doesn\'t start with a capital letter, or end with punctuation' do
    it 'fails' do
      expect {grammar_check('the dog was barking.')}.to raise_error 'That sentence does not have correct grammar, try another.'
    end
    it 'fails' do 
      expect {grammar_check('The dog was barking')}.to raise_error 'That sentence does not have correct grammar, try another.'
    end
    it 'fails' do 
      expect {grammar_check('the dog was barking')}.to raise_error 'That sentence does not have correct grammar, try another.'
    end
  end    
end   