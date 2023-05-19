# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    @facade = ::Doctors::IndexFacade.new
  end

  private

  def doctor_params
    params.require(:doctor).permit(:phone, :name, :category)
  end
end
