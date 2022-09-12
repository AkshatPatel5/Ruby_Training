# frozen_string_literal: true

# String Data Type
puts '--------------------------------String Data Type-----------------------------------------------------'
String1 = 'hello world'
puts "#{String1} Data Type"
puts %(#{String1} escape using "\\\")
puts "#{String1}String1 That's right"

# Boolean Data Type
puts "\n--------------------------------Boolean Data Type-----------------------------------------------------"
if true
  puts 'It is True!'
else
  puts 'It is False!'
end

if nil
  puts 'nil is True!'
else
  puts 'nil is False!'
end

if 0
  puts '0 is True!'
else
  puts '0 is False!'
end

# Numbers Data Type
puts "\n--------------------------------Number Data Type-----------------------------------------------------"

# float type
distance = 0o1

# both integer and float type
time = 9.87 / 3600
speed = distance / time
puts "The average speed of a sprinter is #{speed} km/h"

# Symbols Data Type
puts "\n--------------------------------Symbols Data Type-----------------------------------------------------"

domains = { ak: 'Akshat', vk: 'Vikas', sw: 'Swapnil' }

puts domains[:ak]
puts domains[:vk]
puts domains[:sw]
# iterating every
domains.each do |i|
  puts i
end

# Arrays Data Type
puts "\n--------------------------------Arrays Data Type-----------------------------------------------------"

ary = ['fred', 10, 3.14, 'This is a string', 'last element']
ary.each do |i|
  puts i
end

puts "\n-----------------------------------Hash Data Type-----------------------------------------------------"

dictionary = { 'cat' => 'feline animal', 'dog' => 'canine animal' } 
puts dictionary['cat']
dictionary['cat'] = "fluffy animal"
puts dictionary['cat']
p dictionary.keys
x = { "a" => 1, "b" => 2 }
x.each { |key, value| puts "#{key} equals #{value}" }