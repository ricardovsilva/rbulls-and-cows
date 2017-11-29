require_relative 'utilities/string_utilities'

class Guesser
  def initialize(word_picker)
    @words_history = []
    @excluded_letters = []
    @word_picker = word_picker
  end

  def get_word(cows: 0, bulls: 0)
    result = 
      if cows.zero? and bulls.zero? and @words_history.empty?
        @word_picker.get_random_common_word
      else
        @excluded_letters = @excluded_letters | @words_history.last[:word].split('') unless cows > 0 or bulls > 0

        @words_history.last[:cows] = cows
        @words_history.last[:bulls] = bulls

        @word_picker.words.find { |word| word_is_compatible(word) }
      end

    @words_history.push({word: result, cows: 0, bulls: 0})
    @word_picker.words -= [result]
    return result
  end

  def word_is_compatible(word)
    result = true
    @words_history.each do |try|
       cows_are_compatible = word.intersection_chars(try[:word]).length == try[:cows] + try[:bulls]
       bulls_are_compatible = word.exact_intersection_chars(try[:word]).length == try[:bulls]
       word_has_excluded_letter = word.split('').any? { |letter| @excluded_letters.include? letter }

       result = false unless cows_are_compatible and bulls_are_compatible and not word_has_excluded_letter
    end

    return result
  end
  private :word_is_compatible

end