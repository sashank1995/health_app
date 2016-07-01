class DiseasesController < ApplicationController

  def index
    if params[:commit].present?
      @diseases = Disease.filtering(params[:symptom][:symptom_ids])
    else
      @disease = Disease.all
    end

    @diseases = Disease.all
    #@disease = Disease.find(params[:disease][:symptom_ids])
  end

  def new
    @disease = Disease.new
  end

  def show
    @disease = Disease.find(params[:id])
  end

  def create
    if current_user && current_user.admin?
      @disease = Disease.new(disease_params)
      if @disease.save
        render 'show'
      else
        render 'new'
      end
    else
      @disease = Disease.new(disease_params)
      redirect_to disease_path(@disease)
    end
  end

  def edit
    @disease = Disease.find(params[:id])
  end

  def update
    @disease = Disease.find(params[:id])
    if @disease.update_attributes(disease_params)
      redirect_to static_pages_home_path
    else
      render 'edit'
    end
  end

  def perform_search
    disease_id = params[:disease][:id]
    redirect_to disease_path(disease_id)
  end

  def show_diseases
    byebug
    symps= params[:symptom][:symptom_ids]
    Disease.filtering(symps)
    redirect_to diseases_path
  end

  private

  def disease_params
    params.require(:disease).permit(:name, :disease_id)
  end

end
