

class Hello
end

Hello.instance_eval do
  def hi
    puts "Hi from instance eval"
  end
end

h1 = Hello.new

h1.instance_eval do
  def say_hello
    puts "hello from instance eval"
  end
end

puts Hello.hi
puts h1.say_hello


# Instance_eval lets you to define a method in the context of receiver object

Hello.class_eval do
  def greet
    puts "Greetings from class_eval"
  end
end


h1.greet
h2 = Hello.new
h2.greet

h2.say_hello