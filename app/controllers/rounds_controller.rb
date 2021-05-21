# frozen_string_literal: true

class RoundsController < ApplicationController
  before_action :set_user, only: [:index, :create]

  def index
    # @rounds = Round.filter(params.slice(:course_id)).order(date: :desc)
    @rounds = if params[:course_id].present?
                @user.rounds.where(course_id: params[:course_id])
              else
                @user.rounds
              end
    puts @rounds.length
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
