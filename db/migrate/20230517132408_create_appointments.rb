# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :request
      t.text :recommendation
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
