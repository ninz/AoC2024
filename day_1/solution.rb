def make_list(input, odd_or_even)
  input.values_at(*input.each_index.select(&odd_or_even)).sort
end

contents = File.read("input.txt").split.map(&:to_i)

left = make_list(contents, :even?)
right = make_list(contents, :odd?)

puts left.zip(right).reduce(0) {|sum, item| sum + (item.first - item.last).abs} # part 1
puts left.select {|n| right.include? n}.reduce(0) {|sum, item| sum + item * right.count {|x| x == item}} # part 2
