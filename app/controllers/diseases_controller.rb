class DiseasesController < ApplicationController

  def index
    @disease = Disease.find(params[:disease][:symptom_ids])
  end

  def new
    @disease = Disease.new
  end

  def show
    @disease = Disease.all
    #@disease = Disease.find(params[:name])
  end

  def create
    if current_user && current_user.admin?
      @disease = Disease.new(disease_params)
      if @disease.save
        redirect_to new_symptom_path
      else
        render 'new'
      end
    else
      @disease = Disease.new(disease_params)
      redirect_to @disease
    end
  end

  private

  def disease_params
    params.require(:disease).permit(:name, symptom_ids:[])
  end

end
