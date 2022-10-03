class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new  
  end
  def create
    @patient = Patient.new(patients_params)
    if @patient.save
      redirect_to @patient  
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private

  def patients_params
    params.require(:patient).permit(:name)
  end

end
