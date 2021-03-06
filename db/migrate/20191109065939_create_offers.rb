# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
