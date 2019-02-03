string_AZ = ('a'..'z').zip(1..26).to_h
volwes = %w(a o e u i)
result = {}
volwes.each { |i| result[i] = string_AZ[i] }
puts result
