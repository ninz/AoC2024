input = File.read("input.txt")

pattern = /mul\((?<num1>\d{1,3}),(?<num2>\d{1,3})\)/

result = input.scan(pattern).reduce(0) do |sum, item|
  sum + item[0].to_i * item[1].to_i
end

puts result

part2_pattern = /mul\(\d{1,3},\d{1,3}\)|do\(\)|don\'t\(\)/

do_it = true

result = input.scan(part2_pattern).reduce(0) do |sum, item|
  if item == "do()"
    do_it = true
    sum
  elsif item == "don't()"
    do_it = false
    sum
  else
    m = pattern.match(item)
    if do_it
      sum + m[:num1].to_i * m[:num2].to_i
    else
      sum
    end
  end
end

puts result
