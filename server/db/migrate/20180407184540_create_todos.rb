class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :done
      t.datetime :time
      t.string :starttime
      t.datetime :donetime

      t.timestamps
    end
  end
end
