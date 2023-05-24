# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :find_doctor, only: %i[show create_appointment]
  before_action :authenticate_patient!, only: :create_appointment
  def index
    @facade = ::Doctors::IndexFacade.new(category: params[:category])
  end

  def show
    @facade = ::Doctors::ShowFacade.new(doctor: @doctor)
  end

  def create_appointment
    # @appointment = @doctor.appointments.build(appointment_params)
    # @appointment.patient = current_patient
    @appointment = ::Appointments::Create.call(
      doctor: @doctor, appointment_params:, patient: current_patient
    )

    if @appointment.save
      redirect_to doctor_path(@doctor), notice: 'Appointment created successfully.'
    else
      redirect_to doctor_path(@doctor), alert: 'Appointment creation failed.'
    end
  end

  private

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:request)
  end
end
