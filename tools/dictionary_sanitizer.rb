require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.separator ""

  opts.banner = "This script receives a file with words and sanitize accordignaly to given configuration
    Usage: dictionary_sanitizer.rb [options]"

  opts.on("-l", "--length", "Exactly length of words that will be kept in final sanitized file. Default length is 4") do |length|
    options[:length] = length
  end

  opts.on("-o", "--output [output_file_path]", "Output file, default is current_directory/sanitized.txt") do |output|
    options[:output] = output
  end

  opts.on("-r", "--remove-words-with-duplicated-chars" "Remove words that have duplicated chars") do |remove_words_with_duplicated_chars|
    options[:remove_words_with_duplicated_chars] = remove_words_with_duplicated_chars == "true"
  end

  opts.on("-f", "--file [file_path]", "Path of the input dictionary") do |f|
    options[:input] = f
  end

  options[:length] = 4 unless options[:length]
  options[:output] = 'sanitized.txt' unless options[:output]
end.parse!

raise OptionParser::MissingArgument.new('-f parameter is mandatory. Run dictionary_sanitizer -h to more info.') unless options[:input]
output = File.open(options[:output], "w")
input_lines = File.readlines(options[:input])

puts "Sanitizing file #{options[:input]} to #{options[:output]}. Keeping only words with exactly #{options[:length]} characters length!"

input_lines.each do |word|
  word.gsub!("\n", "")
  word.upcase!
  word_only_has_letters = word[/[A-Za-z]+/] == word
  word_has_duplicated_chars = word.each_char.find { |c| word.count(c) > 1 } != nil

  next unless word_only_has_letters
  next unless word.length == options[:length] 
  next if options[:remove_words_with_duplicated_chars] and word_has_duplicated_chars

  output.puts(word)
end

puts "File sanitized"
