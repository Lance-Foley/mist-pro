class CostCodesController < ApplicationController
  before_action :set_cost_code, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /cost_codes
  def index
    @pagy, @cost_codes = pagy(CostCode.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @cost_codes
  end

  # GET /cost_codes/1 or /cost_codes/1.json
  def show
  end

  # GET /cost_codes/new
  def new
    @cost_code = CostCode.new

    # Uncomment to authorize with Pundit
    # authorize @cost_code
  end

  # GET /cost_codes/1/edit
  def edit
  end

  # POST /cost_codes or /cost_codes.json
  def create
    @cost_code = CostCode.new(cost_code_params)

    # Uncomment to authorize with Pundit
    # authorize @cost_code

    respond_to do |format|
      if @cost_code.save
        format.html { redirect_to @cost_code, notice: "Cost code was successfully created." }
        format.json { render :show, status: :created, location: @cost_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cost_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_codes/1 or /cost_codes/1.json
  def update
    respond_to do |format|
      if @cost_code.update(cost_code_params)
        format.html { redirect_to @cost_code, notice: "Cost code was successfully updated." }
        format.json { render :show, status: :ok, location: @cost_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cost_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_codes/1 or /cost_codes/1.json
  def destroy
    @cost_code.destroy
    respond_to do |format|
      format.html { redirect_to cost_codes_url, status: :see_other, notice: "Cost code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cost_code
    @cost_code = CostCode.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @cost_code
  rescue ActiveRecord::RecordNotFound
    redirect_to cost_codes_path
  end

  # Only allow a list of trusted parameters through.
  def cost_code_params
    params.require(:cost_code).permit(:name, :code, :id_number)

    # Uncomment to use Pundit permitted attributes
    # params.require(:cost_code).permit(policy(@cost_code).permitted_attributes)
  end
end
