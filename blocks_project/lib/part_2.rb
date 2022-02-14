def all_words_capitalized?(arr)
    arr.all? { |c| c == c.capitalize }
end

def no_valid_url?(urls)
    urls_end = [".com", ".net", ".io", ".org"]
    urls.none? { |u| urls_end.include?(u[u.index(".")..-1]) }
end

def any_passing_students?(students)
    students.any? { |s| s[:grades].inject { |sum, el| sum + el }.to_f / s[:grades].size >= 75 }
end
