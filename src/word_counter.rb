require '../src/input_formatter'

class WordCounter

  def frequent_words
    frequency = Hash.new(0)
    $formatted_input.each do |line|
      line = line[1]
      words = line.split
      words.each do |word|
        if word.length > 3
          frequency[word] += 1
        end
      end
    end
    frequency = frequency.sort_by { |x, y| y }
    frequency.reverse!
  end

end