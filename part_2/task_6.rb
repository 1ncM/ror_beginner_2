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
  data[item] = {'price' => price, 'quantity' => quantity}
end

data.each do |key,value|
  puts "name: #{key}, price: #{value['price']}, quantity: #{value['quantity']}, amount: #{value['quantity']*value['price']}"
  cart += value['quantity']*value['price']
end
p cart