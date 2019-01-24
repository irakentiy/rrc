puts 'a'
a = gets.chomp.to_i
puts 'b'
b = gets.chomp.to_i
puts 'c'
c = gets.chomp.to_i
d1 = a**2
d2 = b**2
d3 = c**2
if (d1 == d2 + d3) || (d2 == d1 + d3) || (d3 == d1 + d2)
  print 'orthogonal'
end
if d1 == d2 || d2 == d3 || d3 == d1
  print 'and isosceles'
end
if d1 == d2 && d2 == d3
  print 'equilateral'
end

