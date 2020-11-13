class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    # by naming our migration as "CreateSomething", rails inserts following method for creating a table with the name of the table
    create_table :locations do |t|
      # list all the columns we want 
      t.string :name, null: false
      # t.data_type :column_name, <options in hash>
    end
  end
end
