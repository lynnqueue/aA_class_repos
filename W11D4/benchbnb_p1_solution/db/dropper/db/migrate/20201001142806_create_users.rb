class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :location_id, null: false

      t.timestamps
      # shortcut for below two lines:
      # t.datetime :created_at, null: false
      # t.datetime :updated_at, null: false
    end
    # index is something we add to speed up the look-up
    add_index :users, :location_id
    add_index :users, :username, unique: true
    # add_index :table_name, :column_name, options_hash

    # we can create all tables in one migration, but not recommended
    # create_table :drops do |t|
    # end
  end
end
