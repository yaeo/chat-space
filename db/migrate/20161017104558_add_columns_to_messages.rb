class AddColumnsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference(:messages, :user, null: false, after: :id)
    add_reference(:messages, :group, null: false, after: :user_id)
  end
end
