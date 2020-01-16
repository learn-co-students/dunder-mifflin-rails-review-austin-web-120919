class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show,:edit,:update]


  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params(:first_name,:last_name,:alias,:title,:dog_id))
    if @employee.valid?
      @employee.save
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @employee.update(employee_params(:first_name,:last_name,:alias,:title,:dog_id))
      redirect_to employee_path(@employee)
    else
      render :edit
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params(*args)
    params.require(:employee).permit(*args)
  end

end
