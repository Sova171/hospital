# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :speciality

  index do
    selectable_column
    column :speciality
    actions
  end

  show do
    attributes_table do
      row :speciality
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :speciality
    end
    f.actions
  end

  filter :speciality
end
