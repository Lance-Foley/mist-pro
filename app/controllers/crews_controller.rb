class CrewsController < ApplicationController
  before_action :set_crew, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /crews
  def index
    @pagy, @crews = pagy(Crew.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @crews
  end

  # GET /crews/1 or /crews/1.json
  def show
  end

  # GET /crews/new
  def new
    @crew = Crew.new

    # Uncomment to authorize with Pundit
    # authorize @crew
  end

  # GET /crews/1/edit
  def edit
  end

  # POST /crews or /crews.json
  def create
    @crew = Crew.new(crew_params)

    # Uncomment to authorize with Pundit
    # authorize @crew

    respond_to do |format|
      if @crew.save
        format.html { redirect_to @crew, notice: "Crew was successfully created." }
        format.json { render :show, status: :created, location: @crew }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crews/1 or /crews/1.json
  def update
    respond_to do |format|
      if @crew.update(crew_params)
        format.html { redirect_to @crew, notice: "Crew was successfully updated." }
        format.json { render :show, status: :ok, location: @crew }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crews/1 or /crews/1.json
  def destroy
    @crew.destroy
    respond_to do |format|
      format.html { redirect_to crews_url, status: :see_other, notice: "Crew was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_crew
    @crew = Crew.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @crew
  rescue ActiveRecord::RecordNotFound
    redirect_to crews_path
  end

  # Only allow a list of trusted parameters through.
  def crew_params
    params.require(:crew).permit(:name, :divsion_id, :leader_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:crew).permit(policy(@crew).permitted_attributes)
  end
end
