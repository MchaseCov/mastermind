# Input the secret code and the guess and compare them!
class GameLogic
  def initialize (secret)
    @secret = secret
    @game_round = 1
    @game_over = false
    game_intro()
  end

  def game_intro
    puts '          MASTERMIND!'
    puts '_____________________________________'
    puts 'In this game, the computer has generated a 4 digit code consisting of numbers'
    puts 'from 1 through 6. An example code is 1645 or 5622'
    puts 'Please note that a number can be repeated multiple times!'
    puts 'You will have 12 attempts to guess the secret code.'
    puts 'After every attempt, the code master will tell you if'
    puts 'you have any numbers that are included in the code somewhere'
    puts 'and if you have any numbers that are in the exact position as well!'
    puts 'You will have to use trial and error to know which of your numbers are correct.'
  end

  def input_grabber
    puts "Enter your guess! It is round #{@game_round}. out of 12"
    player_guess = gets.chomp
    if player_guess.chars.all? {|c| ('1'..'6').include?(c)} && player_guess.length == 4
    guess_array = player_guess.split("")
    guess_array.map! do |item|
      item.to_i
    end
    puts "Your guess is #{player_guess}"
    @game_round += 1
    number_compare(guess_array)
    else puts 'Invalid input! Please enter a guess consisting of four numbers from 1 to 6'
    end
  end

  def round_starter
    while @game_over == false && @game_round < 13
      input_grabber()
    end
    return unless @game_round == 13

      puts "The guesser has run out of guesses and the code master wins! The secret code was #{@secret}!"
  end

  def number_compare(player_guess)
    @guess = player_guess

    if @secret == @guess
      puts "You win! The code was #{@secret}!"
      @game_over = true
    else @guess.each_with_index do |item, index|
      if item == @secret[index]
        puts 'You got an exact match!'

      elsif @secret.include? item
        puts 'You have a correct number, but in the wrong location'
      end
    end
    end
  end
end

secret_code = Array.new(4) {rand(1...6)}

print "The secret code is #{secret_code}."

game = GameLogic.new(secret_code)
game.round_starter
