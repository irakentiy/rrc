basket = Hash.new {|hsh, key| hsh[key] = {} }

loop do
  puts 'what product?'
  product = gets.chomp

  break if product == 'stop'

  puts "what's the price?"
  price = gets.chomp.to_f

  puts 'how much?'
  how_much = gets.chomp.to_f

  basket[product][price] = how_much
end
sum_total = 0
basket.each do |product, v|

  sum_product = 0
  v.each do |price, how_much|
    sum_product += price * how_much
    puts "#{product} - #{sum_product}"
  end
  sum_total += sum_product
end
puts "total purchase amount #{sum_total}"

