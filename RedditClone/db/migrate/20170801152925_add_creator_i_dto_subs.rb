class AddCreatorIDtoSubs < ActiveRecord::Migration
  def change

    add_column :subs, :user_id, :integer, null: false
  end
end
