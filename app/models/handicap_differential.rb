# frozen_string_literal: true

class HandicapDifferential
  attr_reader :rating, :score, :slope

  def initialize(rating:, score:, slope:)
    @rating = rating
    @score = score
    @slope = slope
  end

  def calculate
    (((score - rating) * 113) / slope).round(1)
  end
end
