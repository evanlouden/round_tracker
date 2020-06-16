# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @users = User.order(:name)
  end
end
