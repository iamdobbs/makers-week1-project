require 'diary'
require 'diary_entry'
require 'todo_list'
require 'todo'


RSpec.describe 'diary integration' do
  it 'lists out all the entries' do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new('Title 1', 'The Contents')
    diary_entry2 = DiaryEntry.new('Title 2', 'The Contents 2')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    expect(diary.all).to eq [diary_entry1, diary_entry2]
  end

  context 'best reading entry - only one entry available' do
    it 'returns available entry if can be read in time given' do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
      diary.add(diary_entry1)
      result = diary.find_best_entry_for_reading_time(2, 3)
      expect(result).to eq diary_entry1
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
    it 'searches entries for phone number and returns results' do
    diary = Diary.new  
    diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
    diary_entry2 = DiaryEntry.new('Title 2', 'The contents hold the phone number 07703112233.')
    diary_entry3 = DiaryEntry.new('Title 2', 'The contents hold the phone number 07703332211.')
    diary_entry4 = DiaryEntry.new('Title 2', 'The contents hold the phone number 07700001111, 07711445566.')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    diary.add(diary_entry3)
    diary.add(diary_entry4)
    expect(diary.phone_extract).to eq ['07703112233', '07703332211', '07700001111', '07711445566']
  end  
end