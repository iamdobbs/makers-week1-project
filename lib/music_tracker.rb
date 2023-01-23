class MusicTracker
  def initialize
    @tracks = []
  end
  
  def add(track)
    @tracks << track
  end 
  
  def list
    fail "No tracks in list!" if @tracks.empty?
    return @tracks
  end  
end  