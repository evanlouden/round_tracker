class RoundPresenter
  attr_reader :round

  def initialize(round)
    @round = round
  end

  def handicap
    @handicap ||= Handicap.calculate(round)
  end

  def round_differential
    differential = (round.handicap_differential - handicap).round(1)
    differential > 0 ? "+#{differential}" : differential
  end
end
