class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:new, :create, :index]
  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /projects
  def index
    @pagy, @projects = pagy(Project.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @projects
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = @client.projects.build
    # Uncomment to authorize with Pundit
    # authorize @project
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = @client.projects.build(project_params)

    # Uncomment to authorize with Pundit
    # authorize @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to client_path(@client), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to client_path(@client), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, status: :see_other, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @project
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path
  end

  def set_client
    @client = Client.find(params[:client_id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :category, :start_date, :end_date, :cost, :amount_down, :amount_down_date,
                                    :amount_with_held, :amount_with_held_date, :contact_info, :status, :client_id)
    # Uncomment to use Pundit permitted attributes
    # params.require(:project).permit(policy(@project).permitted_attributes)
  end
end
