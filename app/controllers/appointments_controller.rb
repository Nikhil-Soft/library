class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def new
    if params[:patient_id].present?
      @patient = Patient.find_by(id: params[:patient_id])
      @appointment = @patient.appointments.new
    else
      @appointment = Appointment.new  
    end
  end
  
  def create
    if params[:patient_id].present?
      @patient = Patient.find_by(id: params[:patient_id])
      @appointment = @patient.appointments.new(appointments_params)
    else
      @appointment = Appointment.new(appointments_params)
    end
    if @appointment.save
      redirect_to @appointment
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def appointments_params
    params.require(:appointment).permit(:physician_id , :patient_id ,:appointment_date)
  end

end
