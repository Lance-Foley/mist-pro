class Api::V1::CrewMembersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    crew_member = CrewMember.new(crew_member_params)
    if crew_member.save
      render(json: { status: 'success', message: 'Crew member added.' })
    else
      render(json: { status: 'error', message: 'Unable to add crew member.' })
    end
  end

  def destroy
    crew_member = CrewMember.find(params[:id])
    if crew_member.destroy
      render(json: { status: 'success', message: 'Crew member removed.' })
    else
      render(json: { status: 'error', message: 'Unable to remove crew member.' })
    end
  end

  private

  def crew_member_params
    params.require(:crew_member).permit(:crew_id, :employee_id)
  end
end
