def englishNumber number


  if number < 0  # No negative numbers.
    return "Please enter a number that isn\"t negative."
  end
  if number == 0 # If number given is zero
    return "zero"
  end


# ------ STRINGS TO BE USED -----
  numString = ""

  onesPlace = ["one",     "two",       "three",    "four",     "five",
               "six",     "seven",     "eight",    "nine"]
  tensPlace = ["ten",     "twenty",    "thirty",   "forty",    "fifty",
               "sixty",   "seventy",   "eighty",   "ninety"]
  teenagers = ["eleven",  "twelve",    "thirteen", "fourteen", "fifteen",
               "sixteen", "seventeen", "eighteen", "nineteen"]
# ------ STRINGS TO BE USED END -----


# --------- TACKLE TRILLIONS ---------
left = number
write = left/(10**9)
left = left - (write*10**9)

if write > 0
  thousand = englishNumber write
  numString = numString + thousand + " trillion"

  if left > 0
    numString = numString + ", "
  end
end
# --------- TACKLE TRILLIONS END ---------


# --------- TACKLE MILLIONS ---------
write = left/(10**6)
left = left - (write*10**6)

if write > 0
  thousand = englishNumber write
  numString = numString + thousand + " million"

  if left > 0
    numString = numString + ", "
  end
end
# --------- TACKLE MILLIONS END ---------


# --------- TACKLE THOUSANDS ---------
write = left/1000
left = left - write*1000

if write > 0
  thousand = englishNumber write
  numString = numString + thousand + " thousand"

  if left > 0
    numString = numString + ", "
  end
end
# --------- TACKLE THOUSANDS END ---------


# --------- TACKLE HUNDREDS ---------
write = left/100
left = left - write*100

if write > 0
  hundred = englishNumber write
  numString = numString + hundred + " hundred and"

  if left > 0
    numString = numString + " "
  end
end
# --------- TACKLE HUNDREDS END ---------


# --------- TACKLE TENS ---------
  write = left/10
  left  = left - write*10

  if write > 0
    if write == 1 && left > 0
      numString = numString + teenagers[left-1]
      left = 0
    else
      numString = numString + tensPlace[write-1]
    end

    if left >0
      numString = numString + " "
    end
  end
# --------- TACKLE TENS END ---------


# --------- TACKLE SINGLES ---------
write = left
left = 0

if write >0
  numString = numString + onesPlace[write-1]
end
# --------- TACKLE SINGLES END ---------


# Now we just return "numString"...
  numString

end # def englishNumber


# ------------------------------------------
# ---------- END OF METHODS SECTION --------
# ------------------------------------------

puts
puts "How many bottles of beer are on the wall?"
num_bot = gets.chomp.to_i

puts
while num_bot > 0
  puts englishNumber(num_bot) + " bottles of beer on the wall, "
  puts englishNumber(num_bot) + " bottles of beer"
  num_bot -= 1
  puts "Take one down and pass it around, "

  if num_bot ==1
    puts englishNumber(num_bot) + " bottle of beer on the wall, "
    else
    puts englishNumber(num_bot) + " bottles of beer on the wall"
  end
puts
  if num_bot ==1
    puts englishNumber(num_bot) + " bottle of beer on the wall, "
    puts englishNumber(num_bot) + " bottle of beer on the wall"
    num_bot -= 1
    puts "Take one down and pass it around, "
    puts englishNumber(num_bot) + " bottles of beer on the wall."
    puts
  end
end
