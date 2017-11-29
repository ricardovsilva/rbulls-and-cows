require_relative '../lib/guesser'
require_relative '../lib/word_picker'
require_relative '../lib/utilities/string_utilities'
require 'test/unit'

class GuesserTest < Test::Unit::TestCase
  def setup
    @words_dictionary_path = File.join(File.dirname(__FILE__), '../dictionaries/sanitized-dictionary.txt')
    @word_picker = WordPicker.new @words_dictionary_path
    @guesser = Guesser.new(@word_picker)
  end

  def test_get_word__two_guesser_after_initialize__should_return_two_different_words
    first_word = @guesser.get_word
    @guesser = Guesser.new(WordPicker.new @words_dictionary_path)
    second_word = @guesser.get_word

    assert_not_equal(first_word, second_word)
  end

  def test_get_word__second_word_with_one_cow__should_return_another_word_with_at_least_one_letter_in_common
    first_word = @guesser.get_word
    target = @guesser.get_word(cows: 1)
    assert_equal(true, first_word.intersection_chars(target).length > 0)
  end

  def test_get_word__second_word_with_one_cow_and_one_bull__should_return_another_word_with_two_letters_in_common
    first_word = @guesser.get_word
    target = @guesser.get_word(cows: 1, bulls: 1)
    assert_equal(true, first_word.intersection_chars(target).length > 0)
    assert_equal(1, first_word.exact_intersection_chars(target).length)
  end

  def test_get_word__second_word_without_cows_and_bulls__should_return_another_word_without_letter_in_common
    first_word = @guesser.get_word
    target = @guesser.get_word
    assert_equal(true, first_word.intersection_chars(target).length == 0)
  end
end