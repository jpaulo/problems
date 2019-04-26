# i am sure there is a more elegant way to write this in ruby

def valid_braces(braces)
  open_braces = ['(', '{', '[']
  close_braces = [')', '}', ']']
  queue = []

  braces.split("").each do |c|
    if open_braces.include?(c)
      queue << c
      next
    end
    
    return false if queue.empty?
    return false unless open_braces.index(queue.pop) == close_braces.index(c)
  end
  
  return false unless queue.empty?
  true
end

valid_sequences = [
  "({[[({[]})]]})",
  "[]"
]

invalid_sequences = [
  "[}",
  "({[[({[]})]]}){"
]

(valid_sequences + invalid_sequences).each do |seq|
  if valid_braces(seq)
    puts "#{seq} - VALID"
    next
  end

  puts "#{seq} - INVALID"
end
