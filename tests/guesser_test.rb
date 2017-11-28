require '../guesser'
require '../utilities/string_utilities'
require 'test/unit'

class GuesserTest < Test::Unit::TestCase
    def setup
        @guesser = Guesser.new('../dictionaries/sanitized-dictionary.txt') 
    end

    def test_get_word__first_word__should_return_word_with_most_common_letter
        target = @guesser.get_word
        assert_equal(1, target.count('E'))
    end

    def test_get_word__first_word__should_return_word_with_two_of_most_common_letters
        target = @guesser.get_word
        assert_equal(1, target.count('E'))
        assert_equal(1, target.count('T'))
    end

    def test_get_word__second_word_with_one_cow__should_return_another_word_with_one_letter_in_common
        first_word = @guesser.get_word
        target = @guesser.get_word(cows: 1)
        assert_equal(1, first_word.intersection(target))
    end
end