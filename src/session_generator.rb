require '../src/total_tracks'
require '../src/input_formatter'
require '../src/word_counter'

require 'date'

class SessionGenerator

  @@tracks = Array.new
  LIGHTNING_TALK = 5

  def generate_session
    @track_count = -1
    frequency = WordCounter.new.frequent_words
    num_of_tracks = TotalTracks.new.num_of_tracks
    num_of_tracks.times do
      @track_count += 1
      @first_half = 180
      @second_half = 240
      @time = DateTime.new(Time.now.year, Time.now.month, Time.now.day, 9, 0, 0, -1)
      @@tracks.push(["\nTrack " + (@track_count+1).to_s + "\n\n"])
      @word = frequency[@track_count][0]
      session_implementation(true)
      @time = @time + Rational(@first_half, 1440)
      time_entry(input=[60, '** Lunch **'])
      session_implementation(false)
      time_entry(input=[60, 'Networking Event'])
    end
    puts @@tracks
  end

  private

  def session_implementation(check)

    $formatted_input.each do |input|
      if input[0] >= 15
        if input[1].include? @word
          talk_distribution(input, check)
        end
      end
    end
    if check
      if @first_half >= 15
        $formatted_input.reverse.each do |input|
          if input[0] >= 15
            talk_distribution(input, check)
          end
        end
      end
    else
      if @second_half >= 15
        $formatted_input.reverse.each do |input|
          if input[0] >= 15
            talk_distribution(input, check)
          end
        end
      end
      if @second_half >= LIGHTNING_TALK
        $formatted_input.reverse.each do |input|
          if input[0] == LIGHTNING_TALK
            talk_distribution(input, false)
          end
        end
      end
    end

  end

  def talk_distribution(input, check)

    if check
      if input[0] <= @first_half
        distribution_implementation input
        @first_half -= input[0]
      end
    else
      if input[0] <= @second_half
        distribution_implementation input
        @second_half -= input[0]
      end
    end

  end

  def distribution_implementation(input)
    time_entry input
    $formatted_input.delete input
  end

  def time_entry(input)
    if input[0] == 5
      @@tracks[@track_count].push(@time.strftime('%I:%M %p ') + ' - ' + input[1] + ' - Lightning')
    else
      @@tracks[@track_count].push(@time.strftime('%I:%M %p ') + ' - ' + input[1] + ' - ' + input[0].to_s + ' min')
    end
    @time = @time + Rational(input[0], 1440)
  end

end