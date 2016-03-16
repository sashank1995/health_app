class TreatmentsController < ApplicationController

  def index
    @treatment = Treatment.find(params[:treatment][:disease_id])
  end

  def new
    @treatment = Treatment.new
  end


  def create
    if current_user && current_user.admin?
      @treatment = Treatment.new(treatment_params)
      if @treatment.save
        redirect_to static_pages_home_path
      else
        render 'new'
      end
    else
    @treatment = Treatment.new(treatment_params)
    redirect_to @treatment
    end
  end

  #def show
    #@treatment = Treatment.find(params[:treatment][:disease_id])
  #end


  private

  def treatment_params
    params.require(:treatment).permit(:medicine, :food, :activities, :disease_id)
  end
end
