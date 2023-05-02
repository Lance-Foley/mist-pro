class ChangeOrdersController < ApplicationController
  before_action :set_change_order, only: %i[show edit update destroy]

  def index
    @change_orders = ChangeOrder.all
  end

  def show; end

  def new
    @change_order = ChangeOrder.new
  end

  def edit; end

  def create
    @change_order = ChangeOrder.new(change_order_params)

    if @change_order.save
      redirect_to(@change_order, notice: 'Change order was successfully created.')
    else
      render(:new)
    end
  end

  def update
    if @change_order.update(change_order_params)
      redirect_to(@change_order, notice: 'Change order was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @change_order.destroy
    redirect_to(change_orders_url, notice: 'Change order was successfully destroyed.')
  end

  private

  def set_change_order
    @change_order = ChangeOrder.find(params[:id])
  end

  def change_order_params
    params
      .require(:change_order)
      .permit(
        :name,
        :category,
        :start_date,
        :end_date,
        :cost,
        :amount_down,
        :amount_down_date,
        :amount_with_held,
        :amount_with_held_date,
        :contact_info,
        :status,
        :project_id
      )
  end
end
