reports = File.readlines('input.txt').map do |line|
  line.split.map(&:to_i)
end

def level_safe?(line)
  return false if line[0] == line[1]

  asc = line[0] < line[1]

  len = line.length
  (0...len-1).each do |i|
    if asc
      return false if line[i] > line[i+1]
    else
      return false if line[i] < line[i+1]
    end

    diff = (line[i] - line[i+1]).abs
    return false if (diff < 1 || diff > 3)
  end
  true
end

# Part 1
count1 = reports.reduce(0) do |sum, level|
  level_safe?(level) ? sum + 1 : sum
end
puts count1

# Part 2

count2 = 0
reports.each do |line|
  len = line.length
  if level_safe?(line)
    count2 += 1
    next
  else
    (0...len).each do |i|

      new_array = line.reject.with_index { |_, idx| idx == i }

      if level_safe?(new_array)
        count2 += 1
        break
      end
    end
  end
end

puts count2
