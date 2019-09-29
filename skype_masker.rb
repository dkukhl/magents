# frozen_string_literal: true

# Masks skype login
class SkypeMasker < BaseMasker
  private

  def partial
    string.split('skype:').last.split('?').first
  end

  def validate!
    super
    raise ArgumentError, 'Doesn\'t look like skype string' unless string.include?('skype:')
  end
end
