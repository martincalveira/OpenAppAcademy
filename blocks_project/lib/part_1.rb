def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count { |ar| ar.sum > 0}
end

def aba_translate(str)
    vowels = "aeiou"
    dstr = ""
    str.each_char { |c| vowels.include?(c) ? dstr = dstr + c + "b" + c : dstr = dstr + c }
    return dstr
end

def aba_array(arr)
    arr.map { |ele| aba_translate(ele)}
end
