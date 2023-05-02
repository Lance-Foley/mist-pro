class JobsController < ApplicationController
  before_action :set_project
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @jobs = @project.jobs
  end

  def show; end

  def new
    @job = @project.jobs.new
  end

  def create
    @project = Project.find(params[:project_id])
    @job = @project.jobs.new(job_params)

    # Get selected crew_ids
    selected_crew_ids = params[:job][:crew_ids].reject(&:blank?).map(&:to_i)

    if @job.save
      selected_crew_ids.each do |crew_id|
        crew = Crew.find(crew_id)

        # Get selected employee_ids for this crew
        selected_employee_ids = params["crew_#{crew_id}"][:employee_ids].reject(&:blank?).map(&:to_i)

        selected_employee_ids.each do |employee_id|
          employee = Employee.find(employee_id)
          job_assignment = JobAssignment.create(job: @job, employee:, crew:)
        end
      end

      redirect_to project_job_path(@project, @job), notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to([@project, @job], notice: 'Job was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @job.destroy
    redirect_to(project_jobs_url(@project), notice: 'Job was successfully destroyed.')
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_job
    @job = @project.jobs.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:name, :bid_hours, :actual_hours, :start_date, :end_date, :cost_code, :project_id)
  end
end
