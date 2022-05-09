class Hangman 

    def initialize 
        letters = ('a'..'z').to_a
        @word = words.sample 
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

    def begin
        #ask the user for a letter
    puts "Welcome to Hangman"
    puts "The Game has started"
    puts "Your Word is #{ @word.first.size} letters long" 
    word_teaser = ""
    
    @word.first.size.times do
        word_teaser += "_ "
    end 
    
    puts "Your hint is: #{ @word.last}"
    puts "Enter a letter"
    guess = gets.chomp 
end    

end 

game = Hangman.new
game.begin