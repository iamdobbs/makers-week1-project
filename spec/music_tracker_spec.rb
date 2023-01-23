require 'music_tracker'

RSpec.describe MusicTracker do
  it 'add a track to the list' do
    tracker = MusicTracker.new
    result = tracker.add('The APX - Lose Yourself To The Groove')
    expect(result).to eq ['The APX - Lose Yourself To The Groove']
  end 
  
  it 'fails when the list is recalled, but empty' do
    tracker = MusicTracker.new
    expect {tracker.list}.to raise_error "No tracks in list!"
  end 
  
  it 'show one track in a list' do
    tracker = MusicTracker.new
    tracker.add('The APX - Lose Yourself To The Groove')
    expect(tracker.list).to eq ['The APX - Lose Yourself To The Groove']
  end 
  
  it 'show multiple track listings' do
    tracker = MusicTracker.new
    tracker.add('The APX - Lose Yourself To The Groove')
    tracker.add('Daft Punk - Solar Sailer')
    expect(tracker.list).to eq ['The APX - Lose Yourself To The Groove', 'Daft Punk - Solar Sailer']
  end  
end