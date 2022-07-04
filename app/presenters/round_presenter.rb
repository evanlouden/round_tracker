# frozen_string_literal: true
class RoundPresenter
  attr_reader :round

  def initialize(round)
    @round = round
  end

  def handicap
    @handicap ||= Handicap.calculate(round)
  end

  def round_differential
    differential.positive? ? "+#{differential}" : differential
  end

  def differential
    (round.handicap_differential - handicap).round(1)
  end
end
