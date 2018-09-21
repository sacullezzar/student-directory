students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alec DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Kreuger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"]

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_list(names)
  names.each { |student| puts student }
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

print_header
print_list(students)
print_footer(students)
