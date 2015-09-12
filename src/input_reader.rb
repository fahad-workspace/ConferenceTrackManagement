require '../src/input_formatter'

class InputReader

  def read_file(input_file)
    input_array = Array.new
    line_count = 0
    File.readlines(input_file).each do |line|
      line_count += 1
      words = line.split
      min = words.last.gsub('min', '').to_i
      if min > 120
        STDERR.puts "Error at Line Number: #{line_count}\nSession cannot extend 2 hours"
        exit 0
      end
      unless words.last == 'lightning' or /(\d+)min/.match(words.last)
        STDERR.puts "Error at Line Number: #{line_count}"
        exit 0
      end
      input_array.push line
    end
    InputFormatter.new.format_input input_array
  end

end