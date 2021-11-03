class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new company_params

    if @company.save
      respond_to do |format|
        redirect_to :root
      end
    else
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :name
    )
  end

end
