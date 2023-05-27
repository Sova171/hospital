# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show] # Adjust this based on your authentication setup
  before_action :authenticate_doctor!, :find_appointment, only: :update_appointment
  def show
    @facade = ::Profiles::ShowFacade.new(user: current_user)
  end

  def update_appointment
    ::Appointments::Update.call(appointment: @appointment, appointment_params:)

    redirect_to profile_path(current_doctor)
  end

  private

  def find_appointment
    @appointment = current_doctor.appointments.find(params[:appointment_id])
  end

  def appointment_params
    params.require(:appointment).permit(:request, :recommendation, :closed)
  end
end
