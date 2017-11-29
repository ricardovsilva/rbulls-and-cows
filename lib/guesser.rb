require_relative 'utilities/string_utilities'

class Guesser
  def initialize(dictionary_path)
    @words = []
    @words_history = []
    @excluded_letters = []
    File.foreach(dictionary_path) { |word| @words.push(word.chomp) }
  end

  def get_word(cows: 0, bulls: 0)
    if cows.zero? and bulls.zero? and @words_history.empty?
      result = @words.find { |word| word.include?('E') and word.include?('T') }
    else
      @excluded_letters = @excluded_letters | @words_history.last[:word].split('') unless cows > 0 or bulls > 0

      @words_history.last[:cows] = cows
      @words_history.last[:bulls] = bulls

      result = @words.find { |word| word_is_compatible(word) }
    end

    @words_history.push({word: result, cows: 0, bulls: 0})
    @words -= [result]
    return result
  end

  def word_is_compatible(word)
    result = true
    @words_history.each do |try|
       cows_are_compatible = true if word.intersection_chars(try[:word]).length == try[:cows] + try[:bulls]
       bulls_are_compatible = true if word.exact_intersection_chars(try[:word]).length == try[:bulls]
       word_has_excluded_letter = true if word.split('').any? { |letter| @excluded_letters.include? letter }

       result = false unless cows_are_compatible and bulls_are_compatible and not word_has_excluded_letter
    end

    return result
  end
  private :word_is_compatible

end