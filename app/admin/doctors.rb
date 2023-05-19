# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :name, :avatar, :category_id, :phone, :password, :password_confirmation

  index do
    selectable_column
    column :name
    column :category do |doctor|
      doctor.category.present? ? doctor.category.speciality : nil
    end
    column :avatar do |doctor|
      if doctor.avatar.attached?
        image_tag doctor.avatar, width: '50'
      else
        image_tag 'NoAvatarImg.png', width: '50'
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :avatar do |author|
        if author.avatar.attached?
          image_tag author.avatar, width: '100'
        else
          image_tag 'NoAvatarImg.png', width: '100'
        end
      end
      row :category do |doctor|
        doctor.category.present? ? doctor.category.speciality : nil
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :avatar, as: :file
      f.input :category, collection: Category.all.map { |category| [category.speciality, category.id] }
      f.input :phone, placeholder: I18n.t('model.doctor.notification')
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      else
        f.input :password, input_html: { value: '********' }, required: false
        f.input :password_confirmation, input_html: { value: '********' }, required: false
      end
    end
    f.actions
  end

  filter :name
  filter :category, collection: proc { Category.pluck(:speciality, :id) }, multiple: true
end
