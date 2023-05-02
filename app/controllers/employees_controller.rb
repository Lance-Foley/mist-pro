class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Employee.new(employee_params.except(:crew_id))

    if @employee.save
      CrewMember.create(crew_id: params[:employee][:crew_id], employee_id: @employee.id)
      redirect_to(employees_url, notice: 'Employee was successfully created.')
    else
      render(:new)
    end
  end

  def update
    if @employee.update(employee_params.except(:crew_id))
      # Update the associated crew
      crew_member = @employee.crew_member
      if crew_member.present?
        crew_member.update(crew_id: params[:employee][:crew_id])
      else
        CrewMember.create(crew_id: params[:employee][:crew_id], employee_id: @employee.id)
      end

      redirect_to(employees_url, notice: 'Employee was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @employee.destroy
    redirect_to(employees_url, notice: 'Employee was successfully destroyed.')
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :workable_hours, :active, :wage, :email, :phone_number, :crew_id)
  end
end
