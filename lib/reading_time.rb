def reading_time(text)
  words = ((text.split(' ').length) / 200.0).ceil
  words == 1 ? "#{words} minute" : "#{words} minutes" 
end 