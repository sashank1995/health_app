class DiseasesController < ApplicationController

  def index
    @disease = Disease.joins("join diseases_symptoms on diseases_symptoms.diseases_id = diseases.id").where(["diseases_symptoms.symptom_id=?", symptom_id])
  end

  def new
    @disease = Disease.new
  end

  def show
    @disease = Disease.all
    #@disease = Disease.find(params[:name])
  end

  def create
    @disease = Disease.new(disease_params)
    redirect_to @disease
  end

  private

  def disease_params
    params.require(:disease).permit(:name, symptom_ids:[])
  end
end
