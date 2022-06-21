class GuessingGame

    attr_reader :num_attempts
    
    def initialize(min, max)
        @min = min 
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts +=1
        @game_over = true if num == @secret_num
        puts "you win" if num == @secret_num
        puts "too big" if num > @secret_num
        puts "too small" if num < @secret_num
    end

    def ask_user
        puts "enter a number"
        input = gets.chomp.to_i
        self.check_num(input)
    end
end
