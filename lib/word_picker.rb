class WordPicker
	attr_accessor :words

	def initialize(words_source_path)
		@LETTERS_FREQUENCY= {
			0..12019 => 'E',
			12020..21120 => 'T',
			21121..29241 => 'A',
			29242..36922 => 'O',
			36923..44233 => 'I',
			44234..51184 => 'N',
			51185..57465 => 'S',
			57466..63486 => 'R',
			63487..69407 => 'H',
			69408..73728 => 'D',
			73729..77709 => 'L',
			77710..80590 => 'U',
			80591..83301 => 'C',
			83302..85912 => 'M',
			85913..88213 => 'F',
			88214..90324 => 'Y',
			90325..92415 => 'W',
			92416..94446 => 'G',
			94447..96267 => 'P',
			96268..97758 => 'B',
			97759..98869 => 'V',
			98870..99560 => 'K',
			99561..99731 => 'X',
			99732..99842 => 'Q',
			99843..99943 => 'J',
			99944..100000 => 'Z'            
		}
		@random = Random.new
		@words = []
		File.foreach(words_source_path) { |word| @words.push(word.chomp) }
		@words.uniq!
	end

  def get_random_common_word
    possible_words = nil

    while not possible_words do
      first_letter = get_random_letter
      second_letter = get_random_letter except: first_letter

      possible_words = @words.select { |word| word.include?(first_letter) and word.include?(second_letter)}
    end

    random_index = @random.rand(0..possible_words.length)
    return possible_words[random_index]
	end

  def get_random_letter(except: nil)
    letter = nil
    while not letter do
      random_index = @random.rand(0..100000)
      letter = @LETTERS_FREQUENCY.select { |probability| probability === random_index}.values.first
      letter = nil if letter == except
    end

    return letter
	end
end