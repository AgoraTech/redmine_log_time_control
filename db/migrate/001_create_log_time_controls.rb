class CreateLogTimeControls < ActiveRecord::Migration
  def change
    create_table :log_time_controls do |t|
      t.integer :howManyDay
    end
  end
end
