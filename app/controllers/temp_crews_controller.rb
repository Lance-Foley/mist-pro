class TempCrewsController < ApplicationController
  before_action :set_temp_crew, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /temp_crews
  def index
    @pagy, @temp_crews = pagy(TempCrew.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @temp_crews
  end

  # GET /temp_crews/1 or /temp_crews/1.json
  def show
  end

  # GET /temp_crews/new
  def new
    @temp_crew = TempCrew.new

    # Uncomment to authorize with Pundit
    # authorize @temp_crew
  end

  # GET /temp_crews/1/edit
  def edit
  end

  # POST /temp_crews or /temp_crews.json
  def create
    @temp_crew = TempCrew.new(temp_crew_params)

    # Uncomment to authorize with Pundit
    # authorize @temp_crew

    respond_to do |format|
      if @temp_crew.save
        format.html { redirect_to @temp_crew, notice: "Temp crew was successfully created." }
        format.json { render :show, status: :created, location: @temp_crew }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temp_crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_crews/1 or /temp_crews/1.json
  def update
    respond_to do |format|
      if @temp_crew.update(temp_crew_params)
        format.html { redirect_to @temp_crew, notice: "Temp crew was successfully updated." }
        format.json { render :show, status: :ok, location: @temp_crew }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temp_crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_crews/1 or /temp_crews/1.json
  def destroy
    @temp_crew.destroy
    respond_to do |format|
      format.html { redirect_to temp_crews_url, status: :see_other, notice: "Temp crew was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_temp_crew
    @temp_crew = TempCrew.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @temp_crew
  rescue ActiveRecord::RecordNotFound
    redirect_to temp_crews_path
  end

  # Only allow a list of trusted parameters through.
  def temp_crew_params
    params.require(:temp_crew).permit(:job_id, :crew_id, :start_date, :end_date, :name)

    # Uncomment to use Pundit permitted attributes
    # params.require(:temp_crew).permit(policy(@temp_crew).permitted_attributes)
  end
end
