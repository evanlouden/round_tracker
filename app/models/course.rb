# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :rounds

  validates :name, presence: true

  def self.alaphabetical
    order(:name)
  end
end
