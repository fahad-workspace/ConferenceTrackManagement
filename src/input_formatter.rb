class InputFormatter

  def format_input(input_array)

    formatted_input = Array.new

    input_array.each do |line|
      words = line.split
      if words.last == 'lightning'
        duration = 5
      elsif /(\d+)min/.match(words.last)
        duration = words.last.gsub('min', '').to_i
      end
      formatted_input.push([duration, line[0..line.rindex(' ')-1]])
    end

    $formatted_input = formatted_input.sort_by { |x, y| x }.reverse

  end

end