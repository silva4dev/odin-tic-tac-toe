require_relative "./board.rb"
require_relative "./player.rb"

class Game
  def initialize
    @board = Board.new
    @players = [Player.new("Player 1", "X"), Player.new("Player 2", "O")]
    @current_player = @players[0]
  end

  def play
    loop do
      @board.display
      row, col = @current_player.get_move
      if @board.cell_empty?(row - 1, col - 1)
        @board.place_symbol(@current_player.symbol, row - 1, col - 1)
        if @board.winner?(@current_player.symbol)
          @board.display
          puts "#{@current_player.name} wins!"
          return
        elsif @board.full?
          @board.display
          puts "It's a tie!"
          return
        else
          switch_players
        end
      else
        puts "That cell is already taken. Try again."
      end
    end
  end

  private

  def switch_players
    @current_player = @players.find { |player| player != @current_player }
  end
end
