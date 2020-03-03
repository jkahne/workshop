class CreateDbLogger < ActiveRecord::Migration[6.0]
  def change
    create_table :db_loggers do |t|
      t.text :msg
      t.integer :loggable_id
      t.string :loggable_name
      t.string :action

      t.timestamps
    end
  end
end
