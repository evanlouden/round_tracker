# frozen_string_literal: true

class Queries::RoundsQuery
  attr_reader :params
  attr_accessor :rounds

  def initialize(params)
    @params = params
  end

  def self.call(params = {})
    new(params).call
  end

  def call
    rounds = Round.all
    rounds = rounds.where(course_id: params[:course_id]) if filter_by_course?
    rounds = rounds.where(date: params[:start_date]..params[:end_date]) if filter_by_date?
    rounds.order(date: :desc)
  end

  private

  def filter_by_date?
    params[:start_date].present? && params[:end_date].present?
  end

  def filter_by_course?
    params[:course_id].present?
  end
end
