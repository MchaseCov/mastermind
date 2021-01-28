secret_code = Array.new(4) {rand(1...6)}

print "The secret code is #{secret_code}."

input = [1, 2, 3, 4]

# input.each do |item|
#  puts secret_code.include? item
# end



input.each_with_index do |item, index|
  if item == secret_code[index]
    puts "You got an exact match!"
  
  elsif secret_code.include? item
  puts "You have a correct number, but in the wrong location" 
  end 
end