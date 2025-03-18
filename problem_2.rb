def rotate_matrix_counter_clockwise(matrix)
  return nil if matrix.nil?

  n = matrix.length
  return matrix if n <= 1

  matrix.each { |row| row.reverse! }

  (0...n).each do |i|
    (i...n).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end

  matrix
end
