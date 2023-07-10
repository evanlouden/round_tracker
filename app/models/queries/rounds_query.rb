# frozen_string_literal: true

class Queries::RoundsQuery
  attr_reader :params, :user

  def initialize(user, params = {})
    @user = user
    @params = params
  end

  def self.call(user, params = {})
    new(user, params).call
  end

  def call
    rounds = user.rounds
    rounds = rounds.where(course_id: params[:course_id]) if filter_by_course?
    rounds = rounds.where(date: start_date..params[:end_date])
    rounds.order(date: :desc)
  end

  private

  def filter_by_course?
    params[:course_id].present?
  end

  def start_date
    params[:start_date] || Date.new(Time.current.year)
  end
end
