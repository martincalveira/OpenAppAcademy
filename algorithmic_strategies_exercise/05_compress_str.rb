# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    darr = str.split("")
    arr = []
    sum = 0
    (0...darr.length).each do |i|
        if darr[i] == darr[i + 1]
            sum += 1
        else
            arr << ((sum == 0) ? darr[i] : (sum + 1).to_s + darr[i])
            sum = 0
        end
    end
    return arr.join("")
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
