class CreateOfferTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_tag_relations do |t|
      t.references :offer, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
