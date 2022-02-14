# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def swapper(arr, idx_1, idx_2)
    arr[idx_2], arr[idx_1] = arr[idx_1], arr[idx_2]
    return arr
end

def is_sorted(arr)
    (0...arr.length - 1).all? { |idx| arr[idx] <= arr[idx + 1]}
end

def bubble_sort(arr)
    arr_l = arr.length
    while !is_sorted(arr)
        (0...arr_l - 1).each do |i|
            arr = swapper(arr, i, i + 1) if arr[i] > arr[i + 1]
        end
    end
    return arr
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]