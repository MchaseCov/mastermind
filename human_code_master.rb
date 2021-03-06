class HumanMasterCodeInput
  def initialize; end

  def human_code_input
    puts 'Enter your code of 4 digits from 1 through 6 (example: 5361)'
    player_code = gets.chomp
    if player_code.chars.all? {|c| ('1'..'6').include?(c)} && player_code.length == 4
    player_code_array = player_code.split("")
    player_code_array.map! do |item|
      item.to_i
    end
    @code = player_code_array
    puts "Your code is is #{@code}"
    computer = ComputerGuesser.new(@code)
    computer.computer_guess_generator
    else puts 'Invalid input! Please enter a code consisting of four numbers from 1 to 6'
    end
  end
end




#The computer (randomly) attempts to guess the code.
class ComputerGuesser
  def initialize(code)
    @game_round = 0
    @game_over = false
    @code = code
  end 
  def computer_guess_generator()
    sleep(1)
    @game_round += 1
    if @game_over == false && @game_round < 13
      @computer_guess = Array.new(4) { rand(1...6) }
      number_compare(@computer_guess)
    else
      puts "The guesser has run out of guesses and the code master wins! The secret code was #{@code}!"
      thank_you()
    end
  end

  def number_compare(computer_guess)
    @computer_guess = computer_guess
    puts "It is round #{@game_round}. The computer guesses #{@computer_guess}"
    sleep(1)
    if @code == @computer_guess
      puts "The computer successfully guessed your code of #{@code}!"
      @game_over = true
      thank_you()
    else @computer_guess.each_with_index do |item, index|
      if item == @code[index]
        puts 'Computer, you got an exact match!'

      elsif @code.include? item
        puts 'Computer, you have a correct number, but in the wrong location'
      end
      while @game_over == false && @game_round < 13
        computer_guess_generator()
      end
    end
    end
  end

  def thank_you
    puts 'Thank you for playing! Now try breaking the computers code in breaker mode!'
    abort
  end
end
