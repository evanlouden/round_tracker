# frozen_string_literal: true

class Handicap
  attr_reader :round, :include_round

  def self.calculate(round, options = {})
    new(round, options).calculate
  end

  def initialize(round, options)
    @round = round
    @include_round = options[:include_round] || false
  end

  def calculate
    return 0 if top_eight_handicap_differentials.empty?

    (top_eight_handicap_differentials.sum / top_eight_handicap_differentials.length).round(1)
  end

  def top_eight_handicap_differentials
    last_twenty_rounds.map(&:handicap_differential).sort[0..7]
  end

  def last_twenty_rounds
    if include_round
      round.user.rounds.order(date: :desc).limit(20)
    else
      round.user.rounds.where("date < ?", round.date).order(date: :desc).limit(20)
    end
  end
end
