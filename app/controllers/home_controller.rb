# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @user = User.includes(rounds: :course).where(id: 1).first
  end
end
