class CrewsController < ApplicationController
  before_action :set_crew, only: %i[show edit update destroy]

  def index
    @crews = Crew.all
  end

  def show; end

  def new
    @crew = Crew.new
  end

  def edit; end

  def create
    @crew = Crew.new(crew_params)

    if @crew.save
      redirect_to(crews_path, notice: 'Crew was successfully created.')
    else
      render(:new)
    end
  end

  def update
    if @crew.update(crew_params)
      redirect_to(crews_path, notice: 'Crew was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @crew.destroy
    redirect_to(crews_url, notice: 'Crew was successfully destroyed.')
  end

  private

  def set_crew
    @crew = Crew.find(params[:id])
  end

  def crew_params
    params.require(:crew).permit(:name)
  end
end
