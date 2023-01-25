require 'diary'
require 'diary_entry'

RSpec.describe 'diary integration' do
  it 'lists out all the entries' do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new('Title 1', 'The Contents')
    diary_entry2 = DiaryEntry.new('Title 2', 'The Contents 2')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    expect(diary.all).to eq [diary_entry1, diary_entry2]
  end

  context 'reading time behaviour' do
    it 'calculates the reading time for all entries' do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new( 'Title 1', 'The Contents')
      diary_entry2 = DiaryEntry.new('Title 2', 'The Contents 2')
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.reading_time(2)).to eq 3
    end  

    it 'calculates the reading time for all entries' do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new( 'Title 1', 'The Contents are here to extend')
      diary_entry2 = DiaryEntry.new('Title 2', 'the testing options of this test')
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.reading_time(3)).to eq 4
    end 
  end

  context 'best reading entry - only one entry available' do
    it 'returns available entry if can be read in time given' do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
      diary.add(diary_entry1)
      result = diary.find_best_entry_for_reading_time(2, 3)
      expect(result).to eq diary_entry1
    end  
  end  

  it 'returns readable entry out of 1 readable and one not' do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
    diary_entry2 = DiaryEntry.new('Title 2', 'The contents are more than six words long and not applicable in this test')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    result = diary.find_best_entry_for_reading_time(2, 3)
    expect(result).to eq diary_entry1
  end

  it 'returns longest readable entry out of 2 possible' do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
    diary_entry2 = DiaryEntry.new('Title 2', 'This contents total is five.')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    result = diary.find_best_entry_for_reading_time(2, 3)
    expect(result).to eq diary_entry1
  end
end    
