# frozen_string_literal: true

class RoundsController < ApplicationController
  before_action :set_user, only: %i[index create]
  before_action :set_round, only: %i[edit update]

  def index
    @rounds = Queries::RoundsQuery.call(@user, query_params)
  end

  def new
    @round = Round.new(date: Date.today)
  end

  def create
    @round = @user.rounds.build(round_params)
    if @round.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @round = Round.find(params[:id])
  end

  def update
    if @round.update(round_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.includes(rounds: :course).find(1)
  end

  def round_params
    params.require(:round).permit(
      :score,
      :rating,
      :slope,
      :date,
      :course_id,
      :holes,
      :cost
    )
  end

  def query_params
    params.permit(:start_date, :end_date, :course_id)
  end

  def set_round
    @round = Round.find(params[:id])
  end
end
