require 'highline'
require 'io/console' 

class Menu
	def initialize
		@cli = HighLine.new
	end

	def show_greetings
		puts "Hello! And welcome to Bulls and Cows!"
		puts "My name is Waltz, and I will be your second player."

		ask_for_key_to_continue
	end

	def clear_screen
		Gem.win_platform? ? (system "cls") : (system "clear")
	end

	def ask_for_key_to_continue
		puts "Press any key to continue..."
		STDIN.getc
	end

	def show_options
		puts "------------------- MENU -------------------"
		@cli.choose do |menu|
			menu.prompt = "What do you want to do?"
			menu.choice("Show the rules") { 
				clear_screen
					show_the_rules 
				}
				menu.choice("Play") { return :play }
		end
	end

	def say_a_word(word)
		puts "Hmmm. The word you though was #{word}?"
		@cli.choose do |menu|
			menu.choice("Yes") { return true }
			menu.choice("No") { return false }
		end
	end

	def ask_for_a_word
		puts "I really don't know what is your word. No idea, promise!"
		puts "But I love to learn new words"
		new_word = @cli.ask "Can you tell me what was your word? I promise that I will never forget."
		return new_word
	end

	def show_thanks
		puts "Thank you to play with me. Was really really fun!"
		puts "If you want see how I work, take a look at https://github.com/ricardovsilva/rbulls-and-cows"
		puts "Also, if you want know more about my creator, or play any game with he, take a look at http://ricardovsilva.github.io"
	end

	def ask_for_bulls_and_cows
		puts "Oh, ok =/"
		cows = @cli.ask("How many cows it has (press enter for zero)?", Integer) do |q| 
			q.in = 0..4 
			q.default = 0
		end
		
		bulls = @cli.ask("And how many bulls it has (press enter for zero)?", Integer) do |q| 
			q.in = 0..4 
			q.default = 0
		end

		return {bulls: bulls, cows: cows}
	end

	def show_the_rules
		puts 'The rules are really really simple.'
		puts 'You should think in a word in english with exactly 4 letters.'
		puts 'Also, these word cannot have any repeated letter. And I will try to guess what word are you thinking.'
		puts 'When I tell you some word, you should tell me how many bulls and cows are in that word.'
		puts "Whaaaaaaaaaat? Cows? Bulls? Don't be afraid, as I said, it's simple."
		puts "Cow represents a correct letter, but at wrong place."
		puts "And bulls represents a correct letter, at the right place."
		puts "Let's play?\n\n"

		ask_for_key_to_continue
		clear_screen
		show_options
	end
end
