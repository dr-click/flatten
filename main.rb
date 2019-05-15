# main.rb
# Ruby 2.6.3

require 'json'
require_relative 'lib/flatten.rb'

#Read Sample files from Arguments
sample_files = ARGV
sample_files << "samples/samples.txt" unless sample_files.any?

# Loop on sample files
sample_files.each do |sample_file|

  # Read sample lines
  File.open(sample_file).each do |line|
    flatten = Flatten.new(JSON.parse(line))

    puts " #{line.strip} >> >> >> #{flatten.flat}"
  end
end