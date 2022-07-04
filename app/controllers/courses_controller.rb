# frozen_string_literal: true

class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    course = Course.find(params[:id])
    round = course.rounds.last
    render json: {rating: round.rating, slope: round.slope}
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end
