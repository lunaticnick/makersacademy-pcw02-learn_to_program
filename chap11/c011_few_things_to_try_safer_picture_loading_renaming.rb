#  Define where pictures will be moved.
Dir.chdir "/Users/nikolaos/Desktop/renamed_pics"
#  First we find all of the pictures to be moved.
pic_names = Dir['/Users/nikolaos/Desktop/pic_to_rename/*.{JPG,jpg}']


#  Give the name of the photo batch
puts 'What would you like to call this batch?'
batch_name = gets.chomp

puts
print "Downloading #{pic_names.length} files:  "
# This will be our counter. We'll start at 1 today, # though normally I like to count from 0.
pic_number = 1

pic_names.each do |name|
print '.' # This is our "progress bar".

  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.jpg"
  else
    "#{batch_name}#{pic_number}.jpg"
  end

# Protect from overwriting something accidentally
  if File.exist? new_name
    puts "File Already exists"
    exit
  else
    File.rename name, new_name
  end


 #  Finally, we increment the photo number counter.
  pic_number = pic_number + 1
end


puts # This is so we aren't on progress bar line.
puts 'Done!!'
