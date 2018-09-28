require "CSV"

@students = []
@filename = "students.csv"

def data_split(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def save_students
  puts "Which file to save to?"
  puts "1. Default (students.csv)"
  puts "2. Other (please specify)"
  choice = STDIN.gets.chomp
  case choice
  when "2"
    puts "File Name:"
    f_name = STDIN.gets.chomp
    @filename = f_name + ".csv"
    choice = "1"
  when "1"
    CSV.open(@filename, "a") do |csv|
      @students.each do |student|
        csv << [student[:name], student[:cohort]]
      end
    end
  end
  puts "Data saved to #{@filename}"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = @filename
  end # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "#{filename} doesn't exist."
    puts "Create a #{filename} file?"
    option = STDIN.gets.chomp
    if option == "yes"
    file = File.open(@filename, "w")
  end
  end
end

def load_students(filename = @filename)
    CSV.foreach(filename) do |line|
      name, cohort = line
    data_split(name, cohort)
  end
  puts "Student data loaded!"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  puts "Which cohort is #{name} in?"
  cohort = STDIN.gets.chomp
  while !name.empty? do
  data_split(name, cohort)
  puts "Now we have #{@students.count} students"
  puts "Please enter the next student"
  name = STDIN.gets.chomp
  puts "Which cohort is #{name} in?"
  cohort = STDIN.gets.chomp
  end

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
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  if @students.length == 0
    puts "No students entered!"
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
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you want to do, try again" # 4. repeat from step 1
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
