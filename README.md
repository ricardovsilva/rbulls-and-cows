# RBulls and Cows - Bulls and cows guesser made in ruby
This repository is a simple bulls and cows guesser (a little dumb guesser that can be improved) made in ruby.
It's a cool study object because it relies in some concepts like:
- Collections manipulation
- File manipulation
- String manipulation

Also there's some tools available at that repository.

## What is bulls and cows?
Is a very old game, that was originally played by paper and pen.
This is a game to be played by two people. And original rules are:
1. One person will choose a number, with 4 numbers and without repeated numbers;
2. The second person tries to guess that number, he is the guesser
3. At each attempt, first person says to guesser how many cows (correct digits at wrong position) and bulls (correct digits at correct position) his number has;
4. The goal of the game is to guess the number with the least number of possible attempts;

## What the difference between RBulls and Cows and original game?
RBulls and cows use words, instead of numbers. These words must have english words with four unique letters.

## I want to play! How can I run RBulls and Cows guesser?
To run RBulls and Cows you need some programs installed at your computer. They are:
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Gem bundler](http://bundler.io/)

After install programs above, you can clone this repository or download it:
> $ git clone https://github.com/ricardovsilva/rbulls-and-cows

Then browse to folder where you downloaded or cloned that repository:
> $ cd ~/git/rbulls-and-cows

Run bundler to install all necessary dependencies:
> $ bundler

With all installed, run tests to ensure that code that you downloaded works (no one test should fail):
> $ rake

Now is time to start game:
> $ ruby game.rb

Enjoy!

## Changing language of guesser
Guesser looks to a file named sanitized-dictionary.txt, it's inside dictionaries folder. You can put any file, at any language, inside that folder with that name. But, that file should contains one word per line and only words with four unique letters, and I know, it would be very laborious to do this.

For that purpose, I developed a script that will receive an input text file with words and sanitize that for you. For more details run:
> $ ruby tools/dictionary_sanitizer.rb -h

An usage example is:
> $ ruby tools/dictionary_sanitizer.rb -f dictionaries/english-words-full.txt -o dictionaries/sanitized-dictionary.txt -rtrue

