class DosesController < ApplicationController
  before_action :set_cocktail

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose.destroy!
    redirect_to cocktails_path
  end

  private

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end

  #, only: [:show, :edit, :update, :destroy]

  # show is embedded in the cocktail show view
  # def show #---------------------------------------------------------
  # end

  # new is embedded in the cocktail show view
  # def new #----------------------------------------------------------
  #   @cocktail=Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  # end



  # def update #--------------------------------------------------------
  #   if @dose.update(dose_params)
  #     redirect_to cocktail_path(@dose.cocktail_id)
  #   else
  #     render :edit
  #   end
  # end





