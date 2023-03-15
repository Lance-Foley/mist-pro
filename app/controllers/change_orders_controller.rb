class ChangeOrdersController < ApplicationController
  before_action :set_change_order, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /change_orders
  def index
    @pagy, @change_orders = pagy(ChangeOrder.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @change_orders
  end

  # GET /change_orders/1 or /change_orders/1.json
  def show
  end

  # GET /change_orders/new
  def new
    @change_order = ChangeOrder.new

    # Uncomment to authorize with Pundit
    # authorize @change_order
  end

  # GET /change_orders/1/edit
  def edit
  end

  # POST /change_orders or /change_orders.json
  def create
    @change_order = ChangeOrder.new(change_order_params)

    # Uncomment to authorize with Pundit
    # authorize @change_order

    respond_to do |format|
      if @change_order.save
        format.html { redirect_to @change_order, notice: "Change order was successfully created." }
        format.json { render :show, status: :created, location: @change_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @change_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /change_orders/1 or /change_orders/1.json
  def update
    respond_to do |format|
      if @change_order.update(change_order_params)
        format.html { redirect_to @change_order, notice: "Change order was successfully updated." }
        format.json { render :show, status: :ok, location: @change_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @change_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_orders/1 or /change_orders/1.json
  def destroy
    @change_order.destroy
    respond_to do |format|
      format.html { redirect_to change_orders_url, status: :see_other, notice: "Change order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_change_order
    @change_order = ChangeOrder.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @change_order
  rescue ActiveRecord::RecordNotFound
    redirect_to change_orders_path
  end

  # Only allow a list of trusted parameters through.
  def change_order_params
    params.require(:change_order).permit(:name, :cost, :amount_down, :amount_with_held, :start_date, :end_date, :amount_down_date, :amount_with_held_date, :project_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:change_order).permit(policy(@change_order).permitted_attributes)
  end
end
