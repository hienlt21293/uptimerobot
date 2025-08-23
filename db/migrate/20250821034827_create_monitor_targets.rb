class CreateMonitorTargets < ActiveRecord::Migration[8.0]
  def change
    create_table :monitor_targets do |t|
      t.string :name
      t.string :url
      t.string :status

      t.timestamps
    end
  end
end
