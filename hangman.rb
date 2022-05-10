class Hangman 

    def initialize 
        letters = ('a'..'z').to_a
        @word = words.sample 
        @tries = 7
        @correct_guesses = []
        @word_teaser = ""

        @word.first.size.times do
            @word_teaser += "_ "
        end 
    end 

    def words 
        [
            ["tennis", "A game played on a court"],
            ["baseball", "A game played in a diamond"],
            ["football", "A game with two meanings"],
            ["track&field", "A sport about speed"],
            ["basketball", "A gameplayed in and out of a gym"],
        ]  
    end  

    def print_hint last_guess = nil
        update_hint(last_guess) unless last_guess.nil? 
        puts @word_teaser
    end 

    def update_hint
        new_hint = @word_teaser.split

        new_hint.each_with_index do |letter, index|
            #replace blank values with corret leters in the word were trying to guess 
            if letter == '_ ' && @word.first[index] == last_guess
                new_hint[index] = last_guess
            end 
        end
        @word_teaser = new_hint.join(' ')
    end 

    def make_guess
        if @tries > 0  
        puts "Enter a letter"
        guess = gets.chomp 
        # if the letter is not part of the word removed the letters from array 
        good_guess = @word.first.include? guess 

        if guess == 'quit'
            puts "Thank You for playing. come back anytime."        
        elsif good_guess
            puts "Good Job...Try another letter"
            @correct_guesses << guess
            #removed correct guess from alphabet
            @letters.delete guess 
            print_hint guess
            make_guess
        else 
            @tries -= 1
            puts "Sorry Wrong Letter you have #{ @tries } tries left. Try Again!"
            make_guess
        end
            else
                puts "Game Over"
        end 
    end 

    def begin
        #ask the user for a letter
        puts "Welcome to Hangman"
        puts "The Game has started"
        puts "To exit game at any point type 'quit'"
        print_hint    
        puts "Your Word is #{ @word.first.size} letters long"    
        puts "Your hint is: #{ @word.last }" 
        make_guess    
    end
end 

game = Hangman.new
game.begin