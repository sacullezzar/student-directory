@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array

  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
  # get another name from the user
  name = gets.chomp
  end
  # return the array of students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  print "Overall, we have #{names.length} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  if @students.length == 0
    print "No students entered"
  else
    print_header
    print_students(@students)
    print_footer(@students)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you want to do, try again" # 4. repeat from step 1
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
