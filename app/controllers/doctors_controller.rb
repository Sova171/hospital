# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    @facade = ::Doctors::IndexFacade.new
  end
end
