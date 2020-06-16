# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.includes(rounds: :course).find(params[:id])
    @rounds = @user.rounds.order(date: :desc)
  end
end
