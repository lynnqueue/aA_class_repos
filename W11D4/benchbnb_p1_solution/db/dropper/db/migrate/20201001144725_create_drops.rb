class CreateDrops < ActiveRecord::Migration[5.2]
  def change
    create_table :drops do |t|
      t.string :body, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :drops, :author_id
  end
end
