# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.references :category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
