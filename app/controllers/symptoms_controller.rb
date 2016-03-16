class SymptomsController < ApplicationController

  def index
    @symptoms = Symptom.all
  end

  def new
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

  private

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end
