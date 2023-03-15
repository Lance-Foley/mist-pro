class TempEmployeesController < ApplicationController
  before_action :set_temp_employee, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /temp_employees
  def index
    @pagy, @temp_employees = pagy(TempEmployee.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @temp_employees
  end

  # GET /temp_employees/1 or /temp_employees/1.json
  def show
  end

  # GET /temp_employees/new
  def new
    @temp_employee = TempEmployee.new

    # Uncomment to authorize with Pundit
    # authorize @temp_employee
  end

  # GET /temp_employees/1/edit
  def edit
  end

  # POST /temp_employees or /temp_employees.json
  def create
    @temp_employee = TempEmployee.new(temp_employee_params)

    # Uncomment to authorize with Pundit
    # authorize @temp_employee

    respond_to do |format|
      if @temp_employee.save
        format.html { redirect_to @temp_employee, notice: "Temp employee was successfully created." }
        format.json { render :show, status: :created, location: @temp_employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temp_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_employees/1 or /temp_employees/1.json
  def update
    respond_to do |format|
      if @temp_employee.update(temp_employee_params)
        format.html { redirect_to @temp_employee, notice: "Temp employee was successfully updated." }
        format.json { render :show, status: :ok, location: @temp_employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temp_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_employees/1 or /temp_employees/1.json
  def destroy
    @temp_employee.destroy
    respond_to do |format|
      format.html { redirect_to temp_employees_url, status: :see_other, notice: "Temp employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_temp_employee
    @temp_employee = TempEmployee.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @temp_employee
  rescue ActiveRecord::RecordNotFound
    redirect_to temp_employees_path
  end

  # Only allow a list of trusted parameters through.
  def temp_employee_params
    params.require(:temp_employee).permit(:start_date, :end_date, :override_hours, :override_type, :temp_crew_id, :employee_id, :job_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:temp_employee).permit(policy(@temp_employee).permitted_attributes)
  end
end
