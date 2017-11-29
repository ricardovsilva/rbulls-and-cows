require './lib/menu'
require './lib/guesser'

DICTIONARY_PATH = 'dictionaries/sanitized-dictionary.txt'

menu = Menu.new
menu.show_greetings
menu.show_options
menu.clear_screen

puts "Ok, think in a english word, with four letters and without repeated characters"
menu.ask_for_key_to_continue
menu.clear_screen

guesser = Guesser.new(DICTIONARY_PATH)
word = guesser.get_word
is_correct = menu.say_a_word word

while not is_correct and not word.nil? do 
  bulls_and_cows = menu.ask_for_bulls_and_cows
  menu.clear_screen
  word = guesser.get_word(bulls_and_cows)
  is_correct = menu.say_a_word word unless word.nil?
end

if word.nil?
  new_word = menu.ask_for_a_word
  open(DICTIONARY_PATH, 'a') { |f|
    f.puts new_word
  }
end

menu.clear_screen
menu.show_thanks
menu.ask_for_key_to_continue

AFGR