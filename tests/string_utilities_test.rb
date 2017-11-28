require 'test/unit'
require '../utilities/string_utilities'

class StringUtilitiesTest < Test::Unit::TestCase
    
    def test_intersection__strings_with_two_chars_in_common__should_return_number_two
        assert_equal(2, 'aabcd'.intersection('fghaa'))
    end

    def test_intersection__strings_with_different_length_and_one_char_in_common__should_return_number_one
        assert_equal(1, 'aabcd'.intersection('fga'))
    end
end