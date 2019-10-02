require 'sudoku_validator'

describe '#sudoku_validator' do
    it 'returns false if the input contains a 0' do
        expect(sudoku_validator([[0]])).to eq(false)
    end
end