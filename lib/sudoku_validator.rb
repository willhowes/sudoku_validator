# frozen_string_literal: true

def sudoku_validator(sudoku_board)
  sudoku_board.each_with_index do |line, line_index|
    return false if line.include?(0)

    line.each_with_index do |num, num_index|
      line_to_check_index = line_index + 1
      while line_to_check_index < 9
        return false if num == sudoku_board[line_to_check_index][num_index]

        line_to_check_index += 1
      end
    end
  end
  true
end
