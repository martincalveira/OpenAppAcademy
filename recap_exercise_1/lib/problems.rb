# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels_hash = {}
    vowels_pairs = []
    words.each { |word| vowels_hash[word] = word.scan(/[aeiou]+/).join("").split("").sort.uniq }
    (vowels_hash.length - 1).times do
        word1, vowels_in_word1 = vowels_hash.shift
        vowels_hash.each do |word2, vowels_in_word2|
            vowels_pairs << [word1, word2].join(" ") if (vowels_in_word1 + vowels_in_word2).sort.uniq == ["a", "e", "i", "o", "u"]
        end
    end
    vowels_pairs
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    return false if num == 1
    2.upto(num - 1) do |n|
        return true if num % n == 0
    end
    return false
end

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigram_found = []
    bigrams.each do |bigram|
        bigram_found << bigram if str.include?(bigram)
    end
    bigram_found
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        d_hash = {}
        prc ||= Proc.new { |k, v| k == v }
        self.each { |k, v| d_hash[k] = v if prc.call(k, v) }
        d_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        r_arr = []
        length ||= self.length
        (0...self.length).each do |idx1|
            (idx1...self.length).each do |idx2|
                r_arr << self[idx1..idx2]
            end
        end
        length == self.length ? r_arr : r_arr.select { |ele| ele.length == length} 
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        cipher_str = ""
        self.each_char { |c| cipher_str += alphabet[(alphabet.index(c) + num) % alphabet.length] }
        cipher_str
    end
end
