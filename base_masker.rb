# frozen_string_literal: true

# Base class - mask all chars
class BaseMasker
  attr_reader :string, :char

  def initialize(string, char: 'x')
    @string = string
    @char = char
    validate!
  end

  def mask
    partial && string.gsub(partial, char * partial_length) || string
  end

  private

  def validate!
    raise ArgumentError, 'Expected a string' unless string.is_a?(String)
    raise ArgumentError, 'Mask char must be a string' unless char.is_a?(String)
    raise ArgumentError, 'Mask char must be 1 character' unless char.length == 1
  end

  def partial
    string
  end

  def partial_length
    string[partial].length
  end
end
