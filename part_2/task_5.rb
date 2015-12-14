puts "Ведите день"
day = gets.chomp.to_i
puts "Введите месяц"
month = gets.chomp.to_i
puts "Введите год"
year = gets.chomp.to_i

leap_year = if (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)
	true
else
	false
end

month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
if leap_year
  month_days[1] += 1
  month_days
else
  month_days
end

number = 0
month_days.each_with_index do |i,index|
  if (index + 1) == month
    number += day
  elsif (index+1) < month
    number += i
  end
end
puts number