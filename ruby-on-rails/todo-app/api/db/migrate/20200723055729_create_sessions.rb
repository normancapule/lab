class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.text :token
      t.references :user
      t.index [:user_id, :token]

      t.timestamps
    end
  end
end
