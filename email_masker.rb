# frozen_string_literal: true

# Masks first part of email address
class EmailMasker < BaseMasker
  private

  def partial
    string.split('@').first
  end
end
