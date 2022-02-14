# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    return true
end

def largest_prime_factor(num)
    (num - 1).downto(2).each do |i|
        return i if num % i == 0 && is_prime?(i)
    end
    return num
end

def unique_chars?(str)
    darr = str.split("")
    darr.length.times do
        return false if darr.include?(darr.shift)
    end
    return true
end

def unique_elem?(ele, arr)
    i = 0
    arr.each do |e|
        i += 1 if e == ele
        return false if i > 1
    end
    return true
end

def dupe_indices(arr)
    dhash = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index do |ele, i|
        dhash[ele] = dhash[ele] << i if !unique_elem?(ele, arr)
    end
    dhash
end

def elem_indices(arr)
    dhash = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index do |ele, i|
        dhash[ele] = dhash[ele] << i
    end
    dhash
end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length
    dhash1 = elem_indices(arr1)
    dhash2 = elem_indices(arr2)
    arr1.all? do |ele1|
        dhash1[ele1].length == dhash2[ele1].length
    end
end
