data = {}
cart = 0
loop do
  puts "введите название товара"
  item = gets.chomp.to_s
break if item == "стоп" 
  puts "введите стоимость товара"
  price = gets.chomp.to_f
  puts "введите количество товара"
  quantity = gets.chomp.to_f
  data[item] = { "стоимость: #{price}" => "количество: #{quantity} / итог: #{quantity*price}" }
  cart += price*quantity
end
  p data
  puts "итоговая сумма покупок = #{cart}"
