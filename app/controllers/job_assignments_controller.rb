class JobAssignmentsController < ApplicationController
  before_action :set_job_assignment, only: %i[show edit update destroy]

  def index
    @job_assignments = JobAssignment.all
  end

  def show; end

  def new
    @job_assignment = JobAssignment.new
  end

  def edit; end

  def create
    @job_assignment = JobAssignment.new(job_assignment_params)

    if @job_assignment.save
      redirect_to(@job_assignment, notice: 'Job assignment was successfully created.')
    else
      render(:new)
    end
  end

  def update
    if @job_assignment.update(job_assignment_params)
      redirect_to(@job_assignment, notice: 'Job assignment was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @job_assignment.destroy
    redirect_to(job_assignments_url, notice: 'Job assignment was successfully destroyed.')
  end

  private

  def set_job_assignment
    @job_assignment = JobAssignment.find(params[:id])
  end

  def job_assignment_params
    params.require(:job_assignment).permit(:job_id, :employee_id, :crew_id, :employee_start_date)
  end
end
