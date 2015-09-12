require '../src/input_formatter'

class TotalDuration

  def total_duration
    total_talk_duration = 0
    $formatted_input.each do |duration|
      duration = duration[0]
      if duration > 5
        total_talk_duration += duration
      end
    end
    total_talk_duration
  end

end