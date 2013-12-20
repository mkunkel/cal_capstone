require_relative 'date_parser'

puts "enter a date"
input = gets.chomp
puts DateParser.parse(input)