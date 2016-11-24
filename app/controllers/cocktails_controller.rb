class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :create, :destroy, :edit]
  #GET "cocktails"
  def index
    @cocktails = Cocktail.all
  end
  # GET "cocktails/42"
  def show
    @doses = @cocktail.doses
  end
  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end
  # POST "cocktails"
  def create
    @cocktail = Cocktail.new(cocktail_params)

    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'cocktail was successfully created.' }
        format.json { render :show, status: :created, location: @cocktail }
      else
        format.html { render :new }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET "cocktails/42/doses/new"

  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'cocktail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name)
    end

    def find_cocktail
    @cocktail = Cocktail.find(params[cocktail_id])
  end
end
