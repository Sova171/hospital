# frozen_string_literal: true

module Profiles
  class ShowFacade
    attr_reader :user

    def initialize(user:)
      @user = user
    end

    def opened_appointments
      @opened_appointments ||= user.appointments.where(closed: false)
    end

    def closed_appointments
      @closed_appointments ||= user.appointments.where(closed: true)
    end
  end
end
