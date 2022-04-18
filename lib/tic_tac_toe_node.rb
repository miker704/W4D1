require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty = []
  #  debugger
    (0...3).each do |i|
      (0...3).each do |j|
        empty << [i, j] if @board[[i,j]].nil?
        
      end
    end
  
      children= empty.map do |pos|
        next_mover_mark == :x ? next_mover_mark = :o : next_mover_mark = :x
          
          kids_board=board.dup
          kids_board[pos]=next_mover_mark




          TicTacToeNode.new(kids_board,next_mover_mark,pos)
      end


  end
end
