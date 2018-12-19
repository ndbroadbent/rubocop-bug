# frozen_string_literal: true

# Test model
class TestModel < ApplicationRecord
  def test_method
    # rubocop:disable Rails/Output
    puts 'Printing some output'
    # rubocop:enable Rails/Output
  end
end
