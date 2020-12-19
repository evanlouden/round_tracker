# frozen_string_literal: true

class RoundsController < ApplicationController
  before_action :set_course, only: :create

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def round_params
    params.require(:round).permit(
      :score,
      :rating,
      :slope,
      :date,
    ).merge(
      user_id: params[:user_id],
      course_id: @course.id
    )
  end

  def set_course
    @course ||= Course.find_or_create_by(name: params[:round][:course])
  end
end
