class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references  :user, foreign_key: true
      t.references  :group, foreign_key: true
      t.text        :body, null: false
      t.text        :image
      t.timestamps
    end
  end
end
