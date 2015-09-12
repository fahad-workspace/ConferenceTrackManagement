require '../src/total_duration'

class TotalTracks

  def num_of_tracks

    total_talk_duration = TotalDuration.new.total_duration
    total_talk_duration / 360

  end

end