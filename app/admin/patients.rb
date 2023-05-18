# frozen_string_literal: true

ActiveAdmin.register Patient do
  actions :index, :show, :destroy
  permit_params :name, :avatar, :category_id

  index do
    selectable_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
    end
    active_admin_comments
  end

  filter :name
  filter :created_at
end
