require 'test/unit'
require_relative '../lib/word_picker'

class WordPickerTest < Test::Unit::TestCase
  def setup
    word_list_path = File.join(File.dirname(__FILE__), '../dictionaries/sanitized-dictionary.txt')
    @word_picker = WordPicker.new(word_list_path)
  end

  def test_initialize__after_initialize_words__should_not_be_empty
    assert_equal(false, @word_picker.words.empty?)
  end

  def test_initialize__after_initialize_words__should_have_only_unique_words
    assert_equal(@word_picker.words, @word_picker.words.uniq)
  end

  def test_get_random_common_word__call_twice__should_return_two_different_words
    target = @word_picker.get_random_common_word
    assert_not_equal(target, @word_picker.get_random_common_word)
  end

  def test_get_random_common_letter__should_return_random_letter
    target = @word_picker.get_random_letter
    assert_equal(0, target =~ /[[:alpha:]]/)
  end
end