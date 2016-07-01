class SymptomsController < ApplicationController

  def index
    @symptoms = Symptom.all
  end

  def new
    #@disease = Disease.find_by(:id => params[:disease_id])
    @symptom = Symptom.new
  end

  def create
    if current_user && current_user.admin?
      @symptom = Symptom.new(symptom_params)
      if @symptom.save
        render 'new'
      else
        render 'new'
      end
    else
      @symptom = Symptom.new(symptom_params)
    end
  end

  def edit
    @symptom = Symptom.find(params[:id])
  end

  def update
    @symptom = Symptom.find(params[:id])
    if @symptom.update_attributes(symptom_params)
      redirect_to static_pages_home_path
    else
      render 'edit`'
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end
