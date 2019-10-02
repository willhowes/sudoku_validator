# frozen_string_literal: true

require 'sudoku_validator'

describe '#sudoku_validator' do
  it 'returns false if the input contains a 0' do
    expect(sudoku_validator([[0]])).to eq(false)
  end

  it 'returns false if there are any 0s' do
    expect(sudoku_validator([[5, 3, 4, 6, 7, 8, 9, 1, 2],
                             [6, 7, 2, 1, 9, 0, 3, 4, 8],
                             [1, 0, 0, 3, 4, 2, 5, 6, 0],
                             [8, 5, 9, 7, 6, 1, 0, 2, 0],
                             [4, 2, 6, 8, 5, 3, 7, 9, 1],
                             [7, 1, 3, 9, 2, 4, 8, 5, 6],
                             [9, 0, 1, 5, 3, 7, 2, 1, 4],
                             [2, 8, 7, 4, 1, 9, 6, 3, 5],
                             [3, 0, 0, 4, 8, 1, 1, 7, 9]])).to eq(false)
  end

  it 'returns true if there the solution is valid' do
    expect(sudoku_validator([
                              [5, 3, 4, 6, 7, 8, 9, 1, 2],
                              [6, 7, 2, 1, 9, 5, 3, 4, 8],
                              [1, 9, 8, 3, 4, 2, 5, 6, 7],
                              [8, 5, 9, 7, 6, 1, 4, 2, 3],
                              [4, 2, 6, 8, 5, 3, 7, 9, 1],
                              [7, 1, 3, 9, 2, 4, 8, 5, 6],
                              [9, 6, 1, 5, 3, 7, 2, 8, 4],
                              [2, 8, 7, 4, 1, 9, 6, 3, 5],
                              [3, 4, 5, 2, 8, 6, 1, 7, 9]
                            ])).to eq(true)
  end

  it 'returns false if the the solution is invalid' do
    expect(sudoku_validator([
                              [4, 3, 5, 6, 7, 8, 9, 1, 2],
                              [6, 7, 2, 1, 9, 5, 3, 4, 8],
                              [1, 9, 8, 3, 4, 2, 5, 6, 7],
                              [8, 5, 9, 7, 6, 1, 4, 2, 3],
                              [4, 2, 6, 8, 5, 3, 7, 9, 1],
                              [7, 1, 3, 9, 2, 4, 8, 5, 6],
                              [9, 6, 1, 5, 3, 7, 2, 8, 4],
                              [2, 8, 7, 4, 1, 9, 6, 3, 5],
                              [3, 4, 5, 2, 8, 6, 1, 7, 9]
                            ])).to eq(false)
  end

  it 'returns false given a solution that starts 1,2,3,4,5,6,7,8,9 and increments by 1 on each line' do
    expect(sudoku_validator([
                              [1, 2, 3, 4, 5, 6, 7, 8, 9],
                              [2, 3, 4, 5, 6, 7, 8, 9, 1],
                              [3, 4, 5, 6, 7, 8, 9, 1, 2],
                              [4, 5, 6, 7, 8, 9, 1, 2, 3],
                              [5, 6, 7, 8, 9, 1, 2, 3, 4],
                              [6, 7, 8, 9, 1, 2, 3, 4, 5],
                              [7, 8, 9, 1, 2, 3, 4, 5, 6],
                              [8, 9, 1, 2, 3, 4, 5, 6, 7],
                              [9, 1, 2, 3, 4, 5, 6, 7, 8]
                            ])).to eq(false)
  end
  it 'returns false given a solution that starts 1,2,3,4,5,6,7,8,9 and increments by 1 on each line (edge case)' do
    expect(sudoku_validator([
                              [2, 3, 4, 5, 6, 7, 8, 9, 1],
                              [1, 2, 3, 4, 5, 6, 7, 8, 9],
                              [3, 4, 5, 6, 7, 8, 9, 1, 2],
                              [4, 5, 6, 7, 8, 9, 1, 2, 3],
                              [5, 6, 7, 8, 9, 1, 2, 3, 4],
                              [6, 7, 8, 9, 1, 2, 3, 4, 5],
                              [7, 8, 9, 1, 2, 3, 4, 5, 6],
                              [8, 9, 1, 2, 3, 4, 5, 6, 7],
                              [9, 1, 2, 3, 4, 5, 6, 7, 8]
                            ])).to eq(false)
  end
end
