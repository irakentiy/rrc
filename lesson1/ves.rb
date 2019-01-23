puts "Enter your name"
name = gets.chomp
name.capitalize!
puts "enter your height"
height = gets.chomp
height = height.to_i
perfect_growth = (height - 110)
if perfect_growth > 0
print "#{name} your ideal weight #{perfect_growth}"
else 
print "your weight is perfect already"
end