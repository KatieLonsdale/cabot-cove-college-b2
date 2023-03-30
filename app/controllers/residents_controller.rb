class ResidentsController < ApplicationController
  def index
    @residents = Resident.all
  end

  def show
    @resident = Resident.find(params[:resident_id])
    @courses = @resident.list_courses
  end
end