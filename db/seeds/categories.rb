# frozen_string_literal: true

Category.delete_all

@speciality_mas = %w[Cardiology Dermatology Endocrinology Gastroenterology
                     Neurology Orthopedics Pediatrics Urology]

# return and delete rand element from array
def rand_delete(array)
  element = array.sample
  array.delete(element)
  element
end

def create_category
  category = Category.create(
    speciality: rand_delete(@speciality_mas)
  )
  category.save!
end

6.times { create_category }
