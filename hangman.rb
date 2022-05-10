class Hangman 

    def initialize 
        letters = ('a'..'z').to_a
        @word = words.sample 
        @tries = 7
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

    def print_hint
        word_teaser = ""
    
        @word.first.size.times do
            word_teaser += "_ "
        end 

        puts word_teaser

    end 

    def make_guess
        if @tries > 0  
        puts "Enter a letter"
        guess = gets.chomp 
        # if the letter is not part of the word removed the letters from array 
        good_guess = @word.first.include? guess 
        
        if good_guess
            puts "Good Job"
        else 
            @tries -= 1
            puts "Sorry Wrong Letter you have #{ @tries } left. Try Again!"
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
        print_hint
    
        puts "Your Word is #{ @word.first.size} letters long"    
        puts "Your hint is: #{ @word.last }"   

        make_guess
    
    end

end 

game = Hangman.new
game.begin