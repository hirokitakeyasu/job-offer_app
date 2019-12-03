class AddUserIdTooffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :user_id, :bigint, null: false, index: true
  end
end
