class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :user
      t.references :group
      t.timestamps
    end
  end
end
