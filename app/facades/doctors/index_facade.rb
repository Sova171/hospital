# frozen_string_literal: true

module Doctors
  class IndexFacade
    def doctors
      @doctors ||= Doctor.all
    end
  end
end
