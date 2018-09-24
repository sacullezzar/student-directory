class Hash
  def safe_invert
    each_with_object({}) do |(key,value),out|
      out[value] ||= []
      out[value] << key
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "which cohort?"
    cohort = gets.chomp
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end



def print_s_by_c(students)
coh = students.map {|x| x.values}.to_h.safe_invert
coh.each do |key,value|
  puts "The students in the #{key} cohort are:"
  value.each do |name|
    puts name
  end
end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
end
end

#nothing happens until we call the methods
students = input_students
print_header
#print(students)
print_s_by_c(students)
print_footer(students)
