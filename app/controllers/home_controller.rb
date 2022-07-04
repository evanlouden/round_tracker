# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to user_rounds_path(1)
  end
end
