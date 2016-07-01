class TreatmentsController < ApplicationController
  include SessionsHelper

  def index
    @treatments = Treatment.all
    #@treatment = Treatment.find(params[:treatment][:disease_id])
  end

  def new
    @disease = Disease.find_by(:id => params[:disease_id])
    @treatment = @disease.build_treatment
    #@treatment = Treatment.new
  end

  def show
    @disease = Disease.find_by(:id => params[:disease_id])
    @treatment = @disease.treatment
    #@treatment.disease_id = params[:disease_id]
    #@treatment.food = params[:treatment][:food]
    #@treatment.activities = params[:treatment][:activities]
    #@treatment.medicine = params[:treatment][:medicine]
    #@treatment = @disease.create_treatment(treatment_params)
    #@treatment = @disease.build_treatment
    #@treatment = Treatment.find(params[:treatment][:disease_id])
    #@treatment.disease = @disease
  end

  def create
    if current_user && current_user.admin?
      #@treatment = @disease.create_treatment(treatment_params)
      #@treatment.disease = @disease
      @disease = Disease.find_by(:id => params[:disease_id])
      @treatment = Treatment.new
      @treatment.disease_id = params[:disease_id]
      @treatment.food = params[:treatment][:food]
      @treatment.activities = params[:treatment][:activities]
      @treatment.medicine = params[:treatment][:medicine]
      @treatment = @disease.create_treatment(treatment_params)
      if @treatment.save
        redirect_to disease_treatments_path(params[:disease_id])
      else
        render 'new'
      end
    else
      @treatment = Treatment.new(treatment_params)
      redirect_to @treatment
    end
  end

  def edit
    @treatment = Treatment.find(params[:id])
  end

  def update
    @treatment = Treatment.find(params[:id])
    if @treatment.update_attributes(treatment_params)
      redirect_to static_pages_home_path
    else
      render 'edit'
    end
  end

  private

  def treatment_params
    params.require(:treatment).permit(:medicine, :food, :activities, :disease_id)
  end
end
