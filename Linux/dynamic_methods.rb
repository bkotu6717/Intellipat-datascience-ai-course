define_method :hello do
  puts "hello from hello method"
end

hello

['method_a', 'method_b', 'method_c'].each do |mth|
  define_method mth.to_sym do
    puts "hello from #{mth}"
  end
end

method_a
method_b
method_c
