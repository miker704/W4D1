require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    new_node=TicTacToeNode.new(game.board,mark)
    new_node.children.each do |child|
        if child.winning_node?(mark)
          return child.prev_move_pos
        end
    end
    new_node.children.each do |node|
      return node if !node.losing_node?(mark)
    end

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end

