# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rounds

  validates :name, presence: true

  def handicap
    (top_five_handicap_differentials.sum / top_five_handicap_differentials.length).round(1)
  end

  def top_five_handicap_differentials
    last_twenty_rounds.map(&:handicap_differential).sort[0..4]
  end

  def last_twenty_rounds
    @last_20_rounds ||= rounds.order(date: :desc).limit(20)
  end
end
