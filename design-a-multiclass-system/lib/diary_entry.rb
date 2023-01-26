class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  # def contacts_search
  #   phone_nums = @contacts.scan(/(0[1-6][0-9]{8,10}|07[0-9]{9})/).length.times do
  #   return phone_nums
  # end  

  def contacts_search
    numbers_array = []
    i = 0
    @contents.scan(/(0[1-6][0-9]{8,10}|07[0-9]{9})/).length.times do
      numbers_array << @contents.scan(/(0[1-6][0-9]{8,10}|07[0-9]{9})/)[i]
      i += 1
    end
    return numbers_array.flatten
  end

  def count_words
    return 0 if @contents.empty?
    return @contents.count(' ') + 1
  end

  def reading_time(wpm) 
    fail "WPM must be a positive number" unless wpm.positive?
    time_to_read = ((@contents.split(" ").length).to_f / wpm).ceil
    return time_to_read
  end
end