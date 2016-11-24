class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktails_url
    else
      render new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
  def find_cocktail
    @cocktail = cocktail.find(params[:cocktail_id])
  end
end
