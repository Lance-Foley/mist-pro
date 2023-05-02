class JobAssignmentsController < ApplicationController
  before_action :set_job, only: %i[new create]

  def new
    @job_assignment = @job.job_assignments.build
  end

  def create
    @job_assignment = @job.job_assignments.build(job_assignment_params)

    if @job_assignment.save
      redirect_to(job_path(@job), notice: "Job assignment was successfully created.")
    else
      render(:new)
    end
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def job_assignment_params
    params.require(:job_assignment).permit(:crew_id, :employee_id)
  end
end
