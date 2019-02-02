fibo = [0,1]
while fibo[-1] < 89
  fibo << fibo[-1] + fibo[-2]
  fibo.compact! 
end
puts fibo
