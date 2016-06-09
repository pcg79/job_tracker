class JobsController < ApplicationController
  def index
    @jobs = Job.where('').group(:state)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new params[:job]

    if @job.save
    else
    end
  end

  def edit
    @job = Job.find params[:id]
  end

  def update
    @job = Job.find params[:id]

    if @job.save
    else
    end
  end
end
