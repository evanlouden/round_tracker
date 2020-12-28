# frozen_string_literal: true

class RoundsController < ApplicationController
  before_action :set_user, only: [:index, :create]

  def index
  end

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

  def set_user
    @user = User.includes(rounds: :course).find(params[:user_id])
  end

  def round_params
    params.require(:round).permit(
      :score,
      :rating,
      :slope,
      :date,
      :course_id
    ).merge(user: @user)
  end
end
