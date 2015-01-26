class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def show
    @department = Department.includes(:members, :tax_records, :expenses).find(params[:id])
  end
end
