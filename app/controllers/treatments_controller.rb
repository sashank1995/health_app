class TreatmentsController < ApplicationController

  def index
    @treatment = Treatment.find(params[:treatment][:disease_id]).reject(&:blank?) unless params[:treatment].nil?
  end

  def new
    @treatment = Treatment.new
  end


  def create
    @treatment = Treatment.new(treatment_params)
    redirect_to @treatment
  end

  #def show
    #@treatment = Treatment.find(params[:treatment][:disease_id])
  #end


  private

  def treatment_params
    params.require(:treatment).permit(:medicine, :food, :activities, :disease_id)
  end
end
