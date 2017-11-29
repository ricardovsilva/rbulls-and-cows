require 'test/unit'
require_relative '../lib/utilities/string_utilities'

class StringUtilitiesTest < Test::Unit::TestCase
  def test_intersection_chars__strings_with_two_chars_in_common__should_return_array_with_two_chars
    target = 'abcd'.intersection_chars('fghab')
    assert_equal(2, target.length)
    actual = target.include?('a') and target.include?('b')
    assert_equal(true, actual)
  end

  def test_intersection_chars__strings_with_different_length_and_one_char_in_common__should_return_array_with_one_char
    target = 'aabcd'.intersection_chars('fga')
    assert_equal(1, target.length)
    assert_equal(true, target.include?('a'))
  end

  def test_exact_intersection_chars__strings_with_two_equals_chars_at_same_positions__should_return_two
    actual = 'foobar'.exact_intersection_chars('fobloob')
    assert_equal(2, actual.length)
    assert_equal({letter: 'f', position: 0}, actual[0])
    assert_equal({letter: 'o', position: 1}, actual[1])
  end

  def test_exact_intersection_chars__strings_with_two_equals_chars_at_diferent_positions__should_return_zero
    assert_equal(0, 'foobar'.exact_intersection_chars('barfoo').length)
  end
end