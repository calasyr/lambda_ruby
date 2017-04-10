#!./bin/ruby

require 'json'

# You can use this to check your Ruby version from within puts(RUBY_VERSION)
puts "Your Ruby code sees #{ARGV}"

key_count = ARGV.length > 0 ? JSON.parse( ARGV[0] ).length : 0

puts "There are #{key_count} JSON keys."
