number = 2
count = 1
while count < 10
  j = 2
  while j <= number
    break if number%j == 0
    j += 1
  end
  if j == number
    puts number
    count += 1
  end
  number += 1
end
