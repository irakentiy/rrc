months_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts = 'Enter date'
result = gets.chomp.to_i
puts 'Enter month'
month = gets.chomp.to_i - 1

months_days.take(month).each {|i| result += i }

puts 'Enter year'
year = gets.chomp.to_i

if (month > 1) && (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
  result += 1
end

puts result
