class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true, null: false
      t.string :comment

      t.timestamps
    end
    
    add_index :entries,[:user_id, :event_id], unique: true
    add_index :entries,[:event_id, :user_id], unique: true
  end
end
