class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new company_params

    if @company.save
      redirect_to :root
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :name
    )
  end

end
