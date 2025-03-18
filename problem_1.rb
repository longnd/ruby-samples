# A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all
# non-alphanumeric characters, it reads the same forward and backward.
# Alphanumeric characters include letters and numbers.
def palindrome?(str)
  return false unless str.is_a?(String)

  sanitized_str = str.downcase.gsub(/[^a-z0-9]/, '')
  return false if sanitized_str.empty?

  start_index = 0
  end_index = sanitized_str.length - 1

  while start_index < end_index
    return false if sanitized_str[start_index] != sanitized_str[end_index]
    start_index += 1
    end_index -= 1
  end

  true
end
