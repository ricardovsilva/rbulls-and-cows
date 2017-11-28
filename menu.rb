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
        STDIN.getch
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
