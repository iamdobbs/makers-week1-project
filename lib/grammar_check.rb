def grammar_check(string)
  fail "That's not a complete sentence." if string.empty?
  if string[0] == string[0].upcase && [".", "!", "?"].include?(string[-1])
    return "That sentence has correct grammar."
  else
    fail 'That sentence does not have correct grammar, try another.' 
  end
end