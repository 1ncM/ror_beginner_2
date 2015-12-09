puts "Enter your name"
name = gets.chomp
puts "Enter your height"
height = gets.chomp
ideal_weight = height.to_i - 110
if ideal_weight < 0
  puts "Dear #{name}, your weight has optimum !"
else
  puts "Dear #{name}, your ideal weight = #{ideal_weight}"
end