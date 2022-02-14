class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = []
    (@secret_word.length).times { @guess_word << "_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    idx_arr = []
    @secret_word.split("").each_with_index { |e, i| idx_arr << i if e == char }
    idx_arr
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess_word[i] = char}
  end

  def try_guess(char)
    matching_indices = self.get_matching_indices(char)
    matching_indices == [] ? @remaining_incorrect_guesses -= 1 : self.fill_indices(char, matching_indices)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    print "Enter a char: "
    try_guess(gets.chomp)
  end

  def win?
    d_win = @secret_word == @guess_word.join
    p "WIN" if d_win
    d_win
  end

  def lose?
    d_lose = @remaining_incorrect_guesses == 0
    p "LOSE" if d_lose
    d_lose
  end

  def game_over?
    game_over = self.win? || self.lose?
    p @secret_word if game_over
    game_over
  end
end