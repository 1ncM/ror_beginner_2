puts "Введите сторону треугольника"
x1 = gets.chomp.to_f
puts "Введите сторону треугольника"
x2 = gets.chomp.to_f
puts "Введите сторону треугольника"
x3 = gets.chomp.to_f
a,b,c = [x1,x2,x3].sort
if a == b && a == c && b == c
  puts "Треугольник равносторонний"
elsif (a == b || a == c || b == c) && (a*a+b*b == c*c)
  puts "Треугольник равнобедренный и прямоугольный"
elsif (a == b || a == c || b == c)
  puts "Треугольник равнобедренный"
elsif (a*a)+(b*b) == (c*c)
  puts "Треугольник прямоугольный"
else
  p "Неправильный треугольник"
end