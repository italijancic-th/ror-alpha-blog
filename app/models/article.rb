# frozen_string_literal: true

# Class to handle article ORM object
class Article < ApplicationRecord
  # Model validations
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
