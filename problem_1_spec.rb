require_relative 'problem_1.rb'

RSpec.describe 'palindrome?' do
  context 'given a normal text palindrome' do
    it 'returns true' do
      expect(palindrome?("level")).to eq(true)
    end
  end

  context 'given a palindrome with mixed case letters' do
    it 'returns true' do
      expect(palindrome?("Civic")).to eq(true)
      expect(palindrome?("civIC")).to eq(true)
    end
  end

  context 'given a palindrome containing numbers' do
    it 'returns true' do
      expect(palindrome?("12321")).to eq(true)
      expect(palindrome?("1221")).to eq(true)
    end
  end

  context 'given a single-character string' do
    it 'returns true' do
      expect(palindrome?("a")).to eq(true)
      expect(palindrome?("Z")).to eq(true)
      expect(palindrome?("5")).to eq(true)
    end
  end

  context 'given a palindrome phrase with spaces and punctuation' do
    it 'returns true' do
      expect(palindrome?("A man, a plan, a canal: Panama")).to eq(true)
      expect(palindrome?("No lemon, no melon")).to eq(true)
      expect(palindrome?("Was it a car or a cat I saw?")).to eq(true)
    end
  end

  context 'given a non-palindrome' do
    it 'returns false' do
      expect(palindrome?("software")).to eq(false)
      expect(palindrome?("development")).to eq(false)
    end
  end

  context 'given a string with only non-alphanumeric characters' do
    it 'returns false' do
      expect(palindrome?("!!!")).to eq(false)
      expect(palindrome?("   ")).to eq(false)
    end
  end

  context 'given an empty string' do
    it 'returns false' do
      expect(palindrome?("")).to eq(false)
    end
  end

  context 'given non-string input' do
    it 'returns false' do
      expect(palindrome?(12321)).to eq(false)
      expect(palindrome?(nil)).to eq(false)
      expect(palindrome?([])).to eq(false)
      expect(palindrome?({})).to eq(false)
    end
  end
end
