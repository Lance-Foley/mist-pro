class DivisionsController < ApplicationController
  before_action :set_division, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /divisions
  def index
    @pagy, @divisions = pagy(Division.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @divisions
  end

  # GET /divisions/1 or /divisions/1.json
  def show
  end

  # GET /divisions/new
  def new
    @division = Division.new

    # Uncomment to authorize with Pundit
    # authorize @division
  end

  # GET /divisions/1/edit
  def edit
  end

  # POST /divisions or /divisions.json
  def create
    @division = Division.new(division_params)

    # Uncomment to authorize with Pundit
    # authorize @division

    respond_to do |format|
      if @division.save
        format.html { redirect_to @division, notice: "Division was successfully created." }
        format.json { render :show, status: :created, location: @division }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /divisions/1 or /divisions/1.json
  def update
    respond_to do |format|
      if @division.update(division_params)
        format.html { redirect_to @division, notice: "Division was successfully updated." }
        format.json { render :show, status: :ok, location: @division }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divisions/1 or /divisions/1.json
  def destroy
    @division.destroy
    respond_to do |format|
      format.html { redirect_to divisions_url, status: :see_other, notice: "Division was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_division
    @division = Division.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @division
  rescue ActiveRecord::RecordNotFound
    redirect_to divisions_path
  end

  # Only allow a list of trusted parameters through.
  def division_params
    params.require(:division).permit(:name, :utlization_rate, :overtime_rate, :overtime_after)

    # Uncomment to use Pundit permitted attributes
    # params.require(:division).permit(policy(@division).permitted_attributes)
  end
end
