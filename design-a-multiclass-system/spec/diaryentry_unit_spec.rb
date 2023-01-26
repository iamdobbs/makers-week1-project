require 'diary_entry'

RSpec.describe DiaryEntry do
  it 'constructs' do
    diary_entry = DiaryEntry.new('My Title', 'My Contents')
    expect(diary_entry.title).to eq 'My Title'
    expect(diary_entry.contents).to eq 'My Contents'
  end

  context "calculate entry reading time" do
    it 'fails if the wpm is not positive integer' do
      diary_entry = DiaryEntry.new("My Title", "My Contents")
      expect { diary_entry.reading_time(0) }.to raise_error "WPM must be a positive number"
    end  

    it "Return 0 minutes if passsed an empty string" do
      diary_entry = DiaryEntry.new("My Title", "")
      expect(diary_entry.reading_time(10)).to eq(0)
    end

    it "Returns 1 minute if passed 2 words" do
      diary_entry = DiaryEntry.new("My Title", "My Contents")
      expect(diary_entry.reading_time(10)).to eq(1)
    end
  end

  context '@countwords' do
    it 'return 0 if the contents is empty' do
      diary_entry = DiaryEntry.new('Today', '')
      expect(diary_entry.count_words).to eq 0
    end
    it 'return 1 if contents is 1 word' do
      diary_entry = DiaryEntry.new('Today', 'We')
      expect(diary_entry.count_words).to eq 1
    end  
    it 'return 4 if contents == 4 words' do
      diary_entry = DiaryEntry.new('Today', 'We are pair programming')
      expect(diary_entry.count_words).to eq 4
    end
  end  

  it 'searches entries for phone number and returns results' do
    # diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
    diary_entry = DiaryEntry.new('Title 2', 'The contents hold the phone number 07703112233.')
    # diary.add(diary_entry1)
    expect(diary_entry.contacts_search).to eq ['07703112233']
  end       
end  