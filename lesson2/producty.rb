basket = {}

loop do
  puts 'what product?'
  product = gets.chomp

  break if product == 'stop'

  puts 'what the price?'
  price = gets.chomp.to_f

  puts 'how much?'
  how_much = gets.chomp.to_f

  temp = {:price => price, :how_much => how_much }
 
  basket[product] = temp

end
puts basket

sum_total = 0
basket.each do |product, temp|
  sum_product = temp[:price] * temp[:how_much]
  puts "produck #{product} - #{sum_product}"
  sum_total += sum_product
end
puts "total purchase amount #{sum_total}"