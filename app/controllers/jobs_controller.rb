class JobsController < ApplicationController
  def index
    @jobs = Job.where('').group_by(&:state)
    @columns = ['resume_submitted', 'recruiter_contacted', 'initial_interviews', 'code_challenge', 'on_site_interviews', 'salary_negotiation', 'rejected']
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
    @job.state = params[:new_state]

    if @job.save
      head :ok
    else
      render text: @job.errors.full_messages.join(". "), status: 422
    end
  end
end
