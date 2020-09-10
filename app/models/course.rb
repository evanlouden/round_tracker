# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :rounds

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.alaphabetical
    order(:name)
  end
end
