# frozen_string_literal: true

# Masks n last digits in phone number
class PhoneMasker < BaseMasker
  attr_reader :last

  def initialize(string, char: 'x', last: 3)
    @last = last
    super(string, char: char)
  end

  def mask
    masked_chars = 0
    prepared_string.chars.map do |original_char|
      if digit?(original_char) && masked_chars < last
        masked_chars += 1
        char
      else
        original_char
      end
    end.join.reverse
  end

  private

  def digit?(character)
    character.to_i.to_s == character
  end

  def prepared_string
    string.strip.squeeze(' ').reverse
  end

  def validate!
    super
    raise ArgumentError, '\'last\' parameter must be a positive number' unless last.is_a?(Integer) && last.positive?
  end
end
