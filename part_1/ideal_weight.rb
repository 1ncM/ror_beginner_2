puts "Enter your name"
name = gets.chomp.to_f
puts "Enter your height"
height = gets.chomp.to_f
ideal_weight = height - 110
if ideal_weight < 0
  puts "Dear #{name}, your weight has optimum !"
else
  puts "Dear #{name}, your ideal weight = #{ideal_weight}"
end