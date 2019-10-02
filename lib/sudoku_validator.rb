# frozen_string_literal: true

def sudoku_validator(board)
  board.each_with_index do |line, line_index|
    return false if any_zeros?(line)
    return false if any_duplicates_row?(line)
    return false if any_duplicates_column?(board, line, line_index)
  end
  return false if any_duplicates_cell?(board)

  true
end

private

def any_zeros?(line)
  true if line.include?(0)
end

def any_duplicates_row?(line)
  true if line.uniq.length < 9
end

def any_duplicates_column?(board, line, line_index)
  line.each_with_index do |num, num_index|
    line_to_check_index = line_index + 1
    while line_to_check_index < 9
      return true if num == board[line_to_check_index][num_index]

      line_to_check_index += 1
    end
  end
  false
end

SUDOKU_MATRIX = {
  0 => [0, 1, 2, 9, 10, 11, 18, 19, 20],
  1 => [3, 4, 5, 12, 13, 14, 21, 22, 23],
  2 => [6, 7, 8, 15, 16, 17, 24, 25, 26],
  3 => [27, 28, 29, 36, 37, 38, 45, 46, 47],
  4 => [30, 31, 32, 39, 40, 41, 48, 49, 50],
  5 => [33, 34, 35, 42, 43, 44, 51, 52, 53],
  6 => [54, 55, 56, 63, 64, 65, 72, 73, 74],
  7 => [57, 58, 59, 66, 67, 68, 75, 76, 77],
  8 => [60, 61, 62, 69, 70, 71, 78, 79, 80]
}.freeze

def any_duplicates_cell?(board)
  numbers_sudoku_index = compile_sudoku_index(board)
  board.flatten.each_with_index do |number, index|
    cell_number = SUDOKU_MATRIX.find { |_key, values| values.include?(index) }.first
    SUDOKU_MATRIX[cell_number].each do |index_to_check|
      if numbers_sudoku_index[index_to_check] == number && index_to_check != index
        return true
  end
    end
  end
  false
end

def compile_sudoku_index(board)
  numbers_sudoku_index = {}
  board.flatten.each_with_index do |number, index|
    numbers_sudoku_index[index] = number
  end
  numbers_sudoku_index
end
