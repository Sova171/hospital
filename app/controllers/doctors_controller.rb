# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :find_doctor, only: :show
  def index
    @facade = ::Doctors::IndexFacade.new(category: params[:category])
  end

  def show
    @facade = ::Doctors::ShowFacade.new(doctor: @doctor)
  end

  private

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:phone, :name, :category)
  end
end
