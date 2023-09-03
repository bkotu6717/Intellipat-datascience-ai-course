
class Hello
end

Hello.class_eval do
  def say_hi
    puts "Hi.."
  end

  def self.say_hello
    puts "Hello..."
  end
end

Hello.new.say_hi
Hello.say_hello
