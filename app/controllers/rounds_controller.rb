# frozen_string_literal: true

class RoundsController < ApplicationController
  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      redirect_to userexit
      _path(@round.user_id)
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
      :course_id
    ).merge(user_id: params[:user_id])
  end
end
