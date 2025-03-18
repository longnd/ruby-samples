require_relative 'problem_2.rb'

RSpec.describe 'rotate_matrix_counter_clockwise' do
  context 'given a 1x1 matrix' do
    it 'returns the same matrix' do
      matrix = [[1]]
      expect(rotate_matrix_counter_clockwise(matrix)).to eq([[1]])
    end
  end

  context 'given a 2x2 matrix' do
    it 'rotates the matrix 90 degrees counter-clockwise' do
      matrix = [
        [1, 2],
        [3, 4]
      ]
      expected = [
        [2, 4],
        [1, 3]
      ]
      expect(rotate_matrix_counter_clockwise(matrix)).to eq(expected)
    end
  end

  context 'given a 3x3 matrix' do
    it 'rotates the matrix 90 degrees counter-clockwise' do
      matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]
      expected = [
        [3, 6, 9],
        [2, 5, 8],
        [1, 4, 7]
      ]
      expect(rotate_matrix_counter_clockwise(matrix)).to eq(expected)
    end
  end

  context 'given a 4x4 matrix' do
    it 'rotates the matrix 90 degrees counter-clockwise' do
      matrix = [
        [1,  2,  3,  4],
        [5,  6,  7,  8],
        [9,  10, 11, 12],
        [13, 14, 15, 16]
      ]
      expected = [
        [4,  8,  12, 16],
        [3,  7,  11, 15],
        [2,  6,  10, 14],
        [1,  5,  9,  13]
      ]
      expect(rotate_matrix_counter_clockwise(matrix)).to eq(expected)
    end
  end

  context 'given a matrix with non-numeric elements' do
    it 'rotates the matrix correctly' do
      matrix = [
        ['a', 'b'],
        ['c', 'd']
      ]
      expected = [
        ['b', 'd'],
        ['a', 'c']
      ]
      expect(rotate_matrix_counter_clockwise(matrix)).to eq(expected)
    end
  end

  context 'given non-matrix input' do
    it 'returns nil for nil input' do
      expect(rotate_matrix_counter_clockwise(nil)).to be_nil
    end
  end

  context 'given an empty matrix' do
    it 'returns an empty matrix' do
      matrix = []
      expect(rotate_matrix_counter_clockwise(matrix)).to eq([])
    end
  end
end
