def reverser(str, &proc)
    proc.call(str.reverse)
end

def word_changer(str, &proc)
    n_arr = []
    str.split.each { |w| n_arr << proc.call(w)}
    n_arr.join(" ")
end

def greater_proc_value(n, proc_1, proc_2)
    [proc_1.call(n), proc_2.call(n)].max
end

def and_selector(arr, proc_1, proc_2)
    n_arr = []
    arr.each { |e| n_arr << e if (proc_1.call(e) && proc_2.call(e))}
    n_arr
end

def alternating_mapper(arr, proc_1, proc_2)
    n_arr = []
    arr.each_with_index { |e, i| i % 2 == 0 ? n_arr <<  proc_1.call(e) : n_arr <<  proc_2.call(e)}
    n_arr
end

