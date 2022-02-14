def my_map(arr, &proc)
    new_arr = []
    arr.each { |i| new_arr << proc.call(i) }
    new_arr
end

def my_select(arr, &proc)
    new_arr = []
    arr.each { |ele| new_arr << ele if proc.call(ele)}
    new_arr
end

def my_count(arr, &proc)
    count = 0
    arr.each { |ele| count += 1 if proc.call(ele) }
    count
end

def my_any?(arr, &proc)
    ncond = false
    arr.each do |ele|
        ncond = ncond || proc.call(ele)
    end
    ncond
end

def my_all?(arr, &proc)
    ncond = true
    arr.each do |ele|
        ncond = ncond && proc.call(ele)
    end
    ncond
end

def my_none?(arr, &proc)
    ncond = false
    arr.each do |ele|
        ncond = ncond || proc.call(ele)
    end
    !ncond
end
