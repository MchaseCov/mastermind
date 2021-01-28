require_relative 'mastermind_game_logic.rb'
require_relative 'human_code_master.rb'

# Player chooses a role to start the game
class Pregame
  def initialize; end

  def introduction
    puts 'Welcome to MASTERMIND!'
    puts 'Before we begin, would you like to be the code breaker or code master?'
    puts 'please enter "breaker" or "master" now!' 
    player_choice()
  end

  def player_choice
    player_choice = gets.chomp.downcase
    if player_choice == 'breaker'
      secret_code = Array.new(4) {rand(1...6)}
      game = GameLogic.new(secret_code)
      game.round_starter
    elsif player_choice == 'master'
      game = ComputerGuesser.new
      game.human_code_input
    else puts 'Sorry, I didn\'t understand. Please enter "breaker" or "master"'
    end
  end
end

game_run = Pregame.new
game_run.introduction
