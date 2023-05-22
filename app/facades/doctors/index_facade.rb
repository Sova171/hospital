# frozen_string_literal: true

module Doctors
  class IndexFacade
    attr_reader :category

    def initialize(category:)
      @category = category
    end

    def categories
      Category.pluck(:speciality)
    end

    def doctors
      speciality = Category.find_by(speciality: category)
      category.presence ? speciality.doctors : Doctor.all.order(:created_at)
    end
  end
end
