require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.separator ""

  opts.banner = "This script receives a file with words and sanitize accordignaly to given configuration
    Usage: dictionary_sanitizer.rb [options]"

  opts.on("-l", "--length", "Exactly length of words that will be kept in final sanitized file. Default length is 4") do |l|
    options[:length] = l
  end

  opts.on("-o", "--output [output_file_path]", "Output file, default is current_directory/sanitized.txt") do |o|
    options[:output] = o
  end

  opts.on("-f", "--file [file_path]", "Path of the input dictionary") do |f|
    if not f
      p opts.help()
      abort()
    end

    options[:input] = f
  end

  options[:length] = 4 if not options[:length]
  options[:output] = 'sanitized.txt' if not options[:output]
end.parse!

output = File.open(options[:output], "w")
input_lines = File.readlines(options[:input])

puts "Sanitizing file #{options[:input]} to #{options[:output]}. Keeping only words with exactly #{options[:length]} characters length!"

input_lines.each do |word|
   word.gsub!("\n", "")
   word_only_has_letters = word[/[A-Za-z]+/] == word

  if word_only_has_letters and word.length == options[:length]
    output.puts(word.upcase)
  end
end

puts "File sanitized"
