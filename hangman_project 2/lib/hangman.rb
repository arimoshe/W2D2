class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word 
    DICTIONARY.sample
  end
  
  attr_reader :guess_word, :attempted_chars ,:remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

   def already_attempted?(char)
    self.attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    out=[]
    @secret_word.each_char.with_index{ |letter,i| out << i if letter == char}
    out
  end

  def fill_indices(char, arr)
    arr.each{ |ele| @guess_word[ele] = char}
  end

  def try_guess(char)
    matches = self.get_matching_indices(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    elsif  matches == []
      @attempted_chars << char
      @remaining_incorrect_guesses -= 1 
      return true
    else
       @attempted_chars << char
      self.fill_indices(char , matches)
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word 
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose? 
    if remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose? 
      puts @secret_word
      return true
    end
    return false

  end
    


end
