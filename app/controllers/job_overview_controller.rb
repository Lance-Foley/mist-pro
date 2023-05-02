class JobOverviewController < ApplicationController
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)
  end
end
