class SymptomsController < ApplicationController

  def index
    @symptoms = Symptom.all
  end

  def new
    @symptom = Symptom.new
  end

  def create
    @symptom = Symptom.new(symptom_params)
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end
